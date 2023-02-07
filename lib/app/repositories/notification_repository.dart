import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/constants/index.dart';

class NotificationRepository extends Repository {
  Future<bool?> saveToken({
    required String token,
  }) async {
    try {
      final response = await post(
        saveTokenEndPoint,
        {
          'fcm_token': token,
          'device_id': await getDeviceId(),
        },
      );

      print("Send token to server : $token");

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      print(e);
      // return handleError(e);
    }
  }

  Future<Pagination> listNotificationPresetOptions({
    int page = 1,
    int? reportId,
  }) async {
    try {
      return await getPagination(
        listNotificationPresetOptionsEndPoint,
        body: {
          'page': page,
          'report_id': reportId,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }
}
