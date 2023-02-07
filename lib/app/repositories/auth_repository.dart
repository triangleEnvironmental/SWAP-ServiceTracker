import 'dart:io';

import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/constants/index.dart';

class AuthRepository extends Repository {
  Future logout() async {
    try {
      final response = await post(
        logoutEndPoint,
        {},
      );

      if (response.hasError) {
        throw response;
      }
    } catch (_) {}
    return null;
  }

  Future<User?> profile() async {
    try {
      return await getData<User>(
        userInfoEndPoint,
        body: {},
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> updateProfilePhoto(File? profilePhoto) async {
    try {
      final response = await postWithFiles(
        updateProfilePhotoEndPoint,
        files: {
          'profile': profilePhoto,
        },
        compressImage: true,
      );

      return User.fromJson(response['data']);
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Auth?> login({
    required String email,
    required String password,
  }) async {
    try {
      return await postData<Auth>(
        loginEndPoint,
        body: {
          'email': email,
          'password': password,
          'device_id': await getDeviceId(),
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<bool?> forgotPassword(String email) async {
    try {
      final response = await post(
        forgotPasswordEndPoint,
        {
          'email': email,
        },
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> updateInfo({
    required String fullName,
    required String email,
  }) async {
    try {
      return await postData<User>(
        updateProfileEndPoint,
        body: {
          'full_name': fullName,
          'email': email,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<User?> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      return await postData<User>(
        changePasswordEndPoint,
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'password_confirm': confirmPassword,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }
}