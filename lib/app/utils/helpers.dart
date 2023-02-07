import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart' as date_format;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/location_picked_result.dart';
import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:map_launcher/map_launcher.dart' as map_launcher;

bool get devMode {
  return false; // COMMAND-DEBUG
}

Brightness estimateBrightnessForColor(Color color) {
  final double relativeLuminance = color.computeLuminance();
  const double kThreshold = 0.15;
  if ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) > kThreshold) {
    return Brightness.light;
  }
  return Brightness.dark;
}

alert({String? title, String? message}) {
  if (Get.overlayContext != null) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: message,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

onSelectLocale(Locale locale) {
  final settingsService = Get.find<SettingsService>();
  settingsService.updateLocale(locale);
  Get.updateLocale(locale);
  Get.back(
    closeOverlays: true,
    canPop: false,
  );
}

Locale get currentLocale {
  return Get.locale ?? AppValues.fallbackLocale;
}

String get currentLocaleText {
  if (currentLocale.languageCode == 'km') {
    return 'ភាសាខ្មែរ';
  } else {
    return 'English';
  }
}

Widget get currentLocaleIcon {
  if (currentLocale.languageCode == 'km') {
    return Image.asset(
      AppStrings.khmerImage,
      height: 24,
      width: 24,
    );
  } else {
    return Image.asset(
      AppStrings.englishImage,
      height: 24,
      width: 24,
    );
  }
}

openChangeLanguage() {
  if (Get.context != null) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusLg,
        ),
      ),
      context: Get.context!,
      builder: (context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                LocaleKeys.label_select_a_language,
                style: Get.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ).marginSymmetric(
                horizontal: AppDimens.marginHorizontal,
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: Image.asset(
                  AppStrings.khmerImage,
                  height: 24,
                  width: 24,
                ),
                onTap: () {
                  onSelectLocale(
                    const Locale('km', 'KH'),
                  );
                },
                title: const Text('ភាសាខ្មែរ'),
                trailing: currentLocale.languageCode == 'km'
                    ? const Icon(
                        AppIcons.active,
                        color: AppColors.success,
                      )
                    : null,
              ),
              const Divider(
                height: 1,
              ),
              ListTile(
                leading: Image.asset(
                  AppStrings.englishImage,
                  height: 24,
                  width: 24,
                ),
                onTap: () {
                  onSelectLocale(
                    const Locale('en', 'US'),
                  );
                },
                title: const Text('English'),
                trailing: currentLocale.languageCode == 'en'
                    ? const Icon(
                        AppIcons.active,
                        color: AppColors.success,
                      )
                    : null,
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }
}

bool isGloballyLoading = false;

startLoading({
  ValueListenable<double>? indicator,
}) async {
  if (!isGloballyLoading) {
    isGloballyLoading = true;
    await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (indicator != null)
                ValueListenableBuilder(
                  valueListenable: indicator,
                  builder: (context, double progress, _) {
                    return LinearProgressIndicator(
                      value: progress,
                    );
                  },
                ).marginSymmetric(vertical: 20)
              else
                const LoadingWidget(),
              14.y,
              Text(
                LocaleKeys.label_loading,
              ),
            ],
          ),
        ),
      ),
      name: 'loading_dialog',
      barrierDismissible: false,
    );
  }
}

stopLoading() async {
  if (isGloballyLoading) {
    isGloballyLoading = false;
    if (Get.isOverlaysOpen) {
      var reachDialog = false;
      Get.until((route) {
        if (reachDialog) {
          return true;
        }
        if (route.settings.name == 'loading_dialog') {
          reachDialog = true;
        }
        return false;
      });
    }
  }
}

closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String hPrettyJson(Map<String, dynamic> json) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(json);
  return prettyprint;
}

bool isFlatType(dynamic item) {
  return !(item is Iterable || item is Map);
}

Map<String, String> jsonToFormUrlEncoded(Map<String, dynamic> jsonMap) {
  Map<String, dynamic> json1 = jsonMap;
  Map<String, dynamic> json2 = {};

  while (!json1.values.every((element) => isFlatType(element))) {
    for (String key in json1.keys) {
      if (json1[key] is Iterable) {
        for (int i = 0; i < json1[key].length; i++) {
          json2["$key[$i]"] = json1[key][i];
        }
      } else if (json1[key] is Map) {
        for (String key2 in json1[key].keys) {
          json2["$key[$key2]"] = json1[key][key2];
        }
      } else {
        json2[key] = json1[key];
      }
    }
    json1 = json2;
    json2 = {};
  }

  Map<String, String> result = {};
  for (String key in json1.keys) {
    if (json1[key] is bool) {
      result[key] = json1[key] ? '1' : '0';
    } else if (json1[key] is int || json1[key] is double) {
      result[key] = json1[key].toString();
    } else if (json1[key] == null) {
      result[key] = "";
    } else {
      result[key] = json1[key];
    }
  }
  return result;
}

String api(String url) {
  if (url.startsWith('/')) {
    return AppStrings.apiUrl + url;
  } else if (url.startsWith('http')) {
    return url;
  } else {
    return '${AppStrings.apiUrl}/$url';
  }
}

Future<LocationWithAddress?> pickLocation({
  LatLng? initialLocation,
  bool needAddress = false,
}) async {
  final result = await Get.to(
    () => PickLocationPage(
      initialLocation: initialLocation,
      needAddress: needAddress,
    ),
  );
  if (result is LocationWithAddress) {
    return result;
  }
  return null;
}

Future<bool> showConfirmDialog({
  required String title,
  required String content,
}) async {
  var result = await Get.defaultDialog(
    titlePadding: const EdgeInsets.only(top: 20),
    contentPadding: const EdgeInsets.only(
      bottom: 16,
      left: 16,
      right: 16,
    ),
    barrierDismissible: true,
    title: title,
    content: Text(
      content,
      textAlign: TextAlign.center,
    ).marginSymmetric(vertical: 20),
    textConfirm: LocaleKeys.button_confirm,
    cancel: TextButton(
      style: TextButton.styleFrom(
        padding: 20.ph,
      ),
      onPressed: () {
        Get.back(result: false);
      },
      child: Text(LocaleKeys.button_cancel),
    ),
    confirm: FilledButton(
      padding: 20.ph,
      onPressed: () {
        Get.back(result: true);
      },
      child: Text(LocaleKeys.button_confirm),
    ),
  );

  return result == true;
}

bool hHasValue(dynamic variable) {
  if (variable == null || variable == '' || (variable is Iterable && variable.isEmpty)) {
    return false;
  }
  return true;
}

Future<String> reverseGeocode(LatLng location) async {
  var api = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=${AppStrings.googleApiKey}";
  var response = await Repository(isSwapApi: false).get(api);
  try {
    var json = jsonDecode(response.bodyString.toString());
    if (response.isOk && json['results'] is Iterable && json['results'].isNotEmpty && hHasValue(json['results'].first['formatted_address'])) {
      return json['results'].first['formatted_address'];
    } else if (hHasValue(json['error_message'])) {
      throw json['error_message'];
    }
  } catch (e) {
    final locationService = Get.find<LocationService>();
    final result = await locationService.getAddressFromLatLng(location.latitude, location.longitude);
    if (result != null) {
      return result;
    }
    // rethrow;
  }
  return latLngToString(location);
}

String latLngToString(LatLng latLng) {
  return "(${latLng.latitude.toStringAsFixed(3)}, ${latLng.longitude.toStringAsFixed(3)})";
}

viewPhoto({required List<ImageProvider> images, int initIndex = 0}) {
  if (Get.context == null) {
    return;
  }
  GlobalKey widgetKey = GlobalKey();
  showModalBottomSheet(
    context: Get.context!,
    isScrollControlled: true,
    builder: (context) {
      return MediaQuery(
        data: Get.mediaQuery,
        child: ViewPhotoPage(
          key: widgetKey,
          images: images,
          initIndex: initIndex,
        ),
      );
    },
  );
}

Future<List<File>?> pickPhotos() async {
  var imageSource = await Get.defaultDialog(
    titlePadding: const EdgeInsets.only(top: 20),
    contentPadding: const EdgeInsets.only(bottom: 16),
    barrierDismissible: true,
    title: LocaleKeys.label_select_a_photo_source,
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.back(result: ImageSource.camera);
          },
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox.square(
                  dimension: 60,
                  child: Material(
                    borderRadius: AppDimens.borderRadiusLg,
                    color: AppColors.info.withOpacity(0.2),
                    child: const Center(
                      child: Icon(AppIcons.camera),
                    ),
                  ),
                ),
                8.y,
                Text(
                  LocaleKeys.label_camera,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        15.x,
        GestureDetector(
          onTap: () {
            Get.back(result: ImageSource.gallery);
          },
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox.square(
                  dimension: 60,
                  child: Material(
                    borderRadius: AppDimens.borderRadiusLg,
                    color: AppColors.success.withOpacity(0.2),
                    child: const Center(
                      child: Icon(AppIcons.gallery),
                    ),
                  ),
                ),
                8.y,
                Text(
                  LocaleKeys.label_gallery,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ).marginOnly(top: 18),
  );

  if (imageSource is ImageSource) {
    final ImagePicker picker = ImagePicker();

    if (imageSource == ImageSource.gallery) {
      final List<XFile>? images = await picker.pickMultiImage();

      if (images != null) {
        return images.map((e) => File(e.path)).toList();
      }
    } else {
      final XFile? image = await picker.pickImage(
        source: imageSource,
      );

      if (image != null) {
        return [File(image.path)];
      }
    }
  }
  return null;
}

Future<File?> pickPhoto() async {
  var imageSource = await Get.defaultDialog(
    titlePadding: const EdgeInsets.only(top: 20),
    contentPadding: const EdgeInsets.only(bottom: 16),
    barrierDismissible: true,
    title: LocaleKeys.label_select_a_photo_source,
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.back(result: ImageSource.camera);
          },
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox.square(
                  dimension: 60,
                  child: Material(
                    borderRadius: AppDimens.borderRadiusLg,
                    color: AppColors.info.withOpacity(0.2),
                    child: const Center(
                      child: Icon(AppIcons.camera),
                    ),
                  ),
                ),
                8.y,
                Text(
                  LocaleKeys.label_camera,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        15.x,
        GestureDetector(
          onTap: () {
            Get.back(result: ImageSource.gallery);
          },
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox.square(
                  dimension: 60,
                  child: Material(
                    borderRadius: AppDimens.borderRadiusLg,
                    color: AppColors.success.withOpacity(0.2),
                    child: const Center(
                      child: Icon(AppIcons.gallery),
                    ),
                  ),
                ),
                8.y,
                Text(
                  LocaleKeys.label_gallery,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    ).marginOnly(top: 18),
  );

  if (imageSource is ImageSource) {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: imageSource,
    );

    if (image != null) {
      return File(image.path);
    }
  }
  return null;
}

String? getRequestErrorMessage(Map<String, dynamic> response) {
  if (!response.containsKey('message')) {
    return null;
  }
  var message = response['message'];
  if (message == null) {
    return null;
  } else if (message is String) {
    return message;
  } else if (message is Map) {
    if (message.containsKey((Get.locale ?? AppValues.fallbackLocale).languageCode)) {
      return response['message'][(Get.locale ?? AppValues.fallbackLocale).languageCode];
    } else if (message.containsKey('en')) {
      return response['message']['en'];
    }
  }
  return null;
}

String getErrorMessage(dynamic e, {String? notFoundMessage}) {
  if (e == null) {
    return LocaleKeys.phrase_unexpected_error;
  } else if (e is Response) {
    if (notFoundMessage != null && e.statusCode == 404) {
      return notFoundMessage;
    }
    if (e.body is Map) {
      final data = e.body;
      final message = getRequestErrorMessage(Map<String, dynamic>.from(data));
      if (message is String) {
        return (devMode ? '[${e.statusCode}]: ' : '') + message;
      }
    } else {
      if (e.statusCode != null) {
        return devMode ? "[${e.statusCode}]: ${e.bodyString.toString()}" : LocaleKeys.phrase_unexpected_error;
      } else {
        return devMode ? "${e.statusText}" : LocaleKeys.phrase_unexpected_error;
      }
    }
  } else if (e is SocketException) {
    return LocaleKeys.phrase_failed_to_connect_to_server;
  }

  return devMode ? e.toString() : LocaleKeys.phrase_unexpected_error;
}

date_format.DateLocale get dateFormatLocale => currentLocale.languageCode == 'km' ? const date_format.KhmerDateLocale() : const date_format.EnglishDateLocale();

String formatShortDate(DateTime dateTime) {
  return date_format.formatDate(
    dateTime,
    [date_format.d, '/', date_format.M, '/', date_format.yyyy],
    locale: dateFormatLocale,
  );
}

String displayReadableDate(DateTime dateTime) {
  final daysFromNow = DateTime.now().difference(dateTime).inDays;
  if (daysFromNow > 3 || daysFromNow < -3) {
    return date_format.formatDate(
      dateTime,
      [
        date_format.dd,
        ' ',
        date_format.M,
        ' ',
        date_format.yyyy,
        ' ${LocaleKeys.label_at_time} ',
        date_format.hh,
        ':',
        date_format.mm,
        ' ',
        date_format.am,
      ],
      locale: dateFormatLocale,
    );
    // return DateFormat.jms(currentLocale.languageCode).format(dateTime);
  }
  return timeago.format(dateTime, locale: currentLocale.languageCode);
}

LatLng getDefaultLatLng() {
  final locationService = Get.find<LocationService>();
  return locationService.lastLatLng?.location ?? AppValues.defaultLatLng;
}

nextTick(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    callback();
  });
}

navigateToMap(LatLng location, String? title, String? description) async {
  if (await map_launcher.MapLauncher.isMapAvailable(map_launcher.MapType.google) ?? false) {
    await map_launcher.MapLauncher.showMarker(
      mapType: map_launcher.MapType.google,
      coords: map_launcher.Coords(location.latitude, location.longitude),
      title: title ?? LocaleKeys.label_report,
      description: description,
    );
  } else if (await map_launcher.MapLauncher.isMapAvailable(map_launcher.MapType.apple) ?? false) {
    await map_launcher.MapLauncher.showMarker(
      mapType: map_launcher.MapType.apple,
      coords: map_launcher.Coords(location.latitude, location.longitude),
      title: title ?? LocaleKeys.label_report,
      description: description,
    );
  } else {
    final availableMaps = await map_launcher.MapLauncher.installedMaps;

    if (availableMaps.isEmpty) {
      alert(
        message: LocaleKeys.error_no_map_application_found,
      );
      return;
    }

    availableMaps.first.showMarker(
      coords: map_launcher.Coords(location.latitude, location.longitude),
      title: title ?? LocaleKeys.label_report,
      description: description,
    );
  }
}

onDeleteDataInDetailPage() {
  if (Get.arguments is Map && Get.arguments.containsKey('onDelete')) {
    Get.arguments?['onDelete']();
  }
}

removeDataFromPageList<T>(PagingController<int, T> controller, bool Function(T item) query) {
  controller.itemList?.removeWhere(query);
  controller.notifyListeners();
}
