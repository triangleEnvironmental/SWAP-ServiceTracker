import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get.dart';
import 'package:moderator_app/app/globals/fcm_helpers.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:moderator_app/app/utils/index.dart';

class Repository extends GetConnect {
  final bool isSwapApi;

  Repository({this.isSwapApi = true}) {
    onInit();
  }

  @override
  void onInit() {
    if (isSwapApi) {
      httpClient.baseUrl = AppStrings.apiUrl;
      print("Connect to ${AppStrings.apiUrl}");
    }
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 45);

    httpClient.addAuthenticator<dynamic>((request) async {
      final authService = Get.find<AuthService>();
      if (authService.auth != null) {
        request.headers['Authorization'] = authService.auth!.authorization;
      } else {
        print("Not logged in");
      }

      return request;
    });

    httpClient.addRequestModifier<void>((request) async {
      request.headers.addAll(_headers);
      final client = await clientInfo;
      request.headers['X-CLIENT-INFO'] = jsonEncode(client);

      return request;
    });

    httpClient.addResponseModifier((request, response) async {
      if (response.unauthorized) {
        final authService = Get.find<AuthService>();
        // Login again
        if (authService.isLoggedIn) {
          authService.clear();
          revokeFcmToken();
          Get.offAllNamed(Routes.routeLogin);
        }
        return response;
      }

      return response;
    });

    httpClient.maxAuthRetries = 3;

    super.onInit();
  }

  Future<String> getDeviceId() async {
    String? udid;
    try {
      udid = await FlutterUdid.consistentUdid;
    } catch (_) {}

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var info = await deviceInfo.androidInfo;
      return "${info.model}/${info.version.codename}/${udid ?? info.id}";
    } else if (Platform.isIOS) {
      var info = await deviceInfo.iosInfo;
      return "${info.model}/${info.systemVersion}/${udid ?? info.identifierForVendor}";
    }
    return udid ?? '[UNKNOWN ID]';
  }

  Future<Map<String, dynamic>> get clientInfo async {
    return {
      "p": () {
        if (Platform.isAndroid) {
          return 1;
        } else if (Platform.isIOS) {
          return 2;
        } else if (kIsWeb) {
          return 3;
        } else if (Platform.isMacOS || Platform.isWindows) {
          return 4;
        }
      }(),
      "d_id": await getDeviceId(),
      "v": AppStrings.version,
    };
  }

  Map<String, String> get _headers {
    Map<String, String> headers = {
      HttpHeaders.acceptHeader: "application/json",
      'X-Localization': (Get.locale ?? AppValues.fallbackLocale).languageCode,
    };

    final authService = Get.find<AuthService>();
    if (authService.auth != null) {
      headers['Authorization'] = authService.auth!.authorization;
    } else {
      print("Not logged in");
    }

    return headers;
  }

  Future<T> postData<T>(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await post(
      url,
      body,
    );

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return deserialize<T>(json['data']);
  }

  Future<T> putData<T>(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await put(
      url,
      body,
    );

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return deserialize<T>(json['data']);
  }

  Future<List<T>> postList<T>(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await post(
      url,
      body,
    );

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return deserializeList<T>(json);
  }

  Future<Pagination> getPagination(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await get(
      url,
      query: body,
    );

    print(response.request?.url);

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return Pagination.fromJson(json);
  }

  Future<T> getData<T>(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await get(
      url,
      query: body,
    );

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return deserialize<T>(json['data']);
  }

  Future<List<T>> getList<T>(
      String url, {
        Map<String, dynamic>? body,
      }) async {
    var response = await get(
      url,
      query: body,
    );

    print(response.request?.url);

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return deserializeList<T>(json);
  }

  Future<Map<String, dynamic>> putWithFiles(
      String url, {
        Map<String, dynamic>? body,
        Map<String, File>? files,
        bool compressImage = false,
      }) async {
    return postWithFiles(
      url,
      putMethod: true,
      body: body,
      files: files,
      compressImage: compressImage,
    );
  }

  _compressImage(Uint8List binary) async {
    return await FlutterImageCompress.compressWithList(
      binary,
      minHeight: 1500,
      minWidth: 1500,
      quality: 60,
      keepExif: true,
    );
  }

  _addFileToFormData(Map<String, dynamic> formData, String key, dynamic file, {bool compressImage = false}) async {
    if (compressImage) {
      var data = file;
      if (file is Uint8List) {
        data = await _compressImage(file);
      } else if (file is File) {
        data = await _compressImage(await file.readAsBytes());
      }
      formData[key] = MultipartFile(
        data,
        filename: file is File ? file.path : 'image_binary.png',
      );
    } else {
      formData[key] = MultipartFile(
        file,
        filename: file is File ? file.path : 'image_binary.png',
      );
    }
  }

  Future<Map<String, dynamic>> postWithFiles(
      String url, {
        bool putMethod = false,
        Map<String, dynamic>? body,
        Map<String, dynamic>? files, // dynamic are File, List<File>, Uint8List, List<Uint8List>
        bool compressImage = false,
        Function(double)? uploadProgress,
      }) async {
    var form = body ?? {};
    if (files != null) {
      for (final entry in files.entries) {
        final key = entry.key;
        final value = entry.value;
        if (value is File || value is Uint8List) {
          await _addFileToFormData(form, key, value, compressImage: compressImage);
        } else if (value is List<File> || value is List<Uint8List>) {
          int index = 0;
          for (var file in value) {
            await _addFileToFormData(form, '$key[${index++}]', file, compressImage: compressImage);
          }
        } else {
          form[key] = value;
        }
      }
    }

    if (putMethod) {
      form['_method'] = 'PUT';
    }

    final response = await post(
      url,
      FormData(form),
      contentType: 'multipart/form-data;',
      uploadProgress: uploadProgress,
    );

    if (response.hasError) {
      throw response;
    }

    final json = jsonDecode(response.bodyString.toString());

    return json;
  }

  @override
  Future<Response<T>> get<T>(
      String url, {
        Map<String, String>? headers,
        String? contentType,
        Map<String, dynamic>? query,
        Decoder<T>? decoder,
      }) {
    return super.get<T>(
      url,
      headers: headers,
      contentType: contentType,
      query: _convertQueryValueToString(query),
      decoder: decoder,
    );
  }

  _convertQueryValueToString(Map<String, dynamic>? query) {
    if (query == null) {
      return null;
    }
    return query.map(
          (key, value) => MapEntry(
            () {
          if (value is List) {
            return '$key[]';
          } else {
            return key;
          }
        }(),
            () {
          if (value is String || value is List<String>) {
            return value;
          } else if (value is List) {
            return value.map((v) => "$v").toList();
          } else {
            return "$value";
          }
        }(),
      ),
    );
  }

  handleError(Object e) {
    alert(
      message: getErrorMessage(e),
    );
    return;
  }
}
