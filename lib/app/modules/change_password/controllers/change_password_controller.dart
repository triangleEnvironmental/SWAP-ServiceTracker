import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/helpers.dart';

class ChangePasswordController extends GetxController {
  final authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      final result = await authRepository.changePassword(
        currentPassword: currentPassword.text,
        newPassword: newPassword.text,
        confirmPassword: confirmPassword.text,
      );
      stopLoading();
      if (result is User) {
        Get.offAllNamed(Routes.routeLogin);
      }
    }
  }
}
