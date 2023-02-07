import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/repositories/auth_repository.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ForgotPasswordController extends GetxController {
  final authRepository = AuthRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();

  showSuccessDialog() async {
    await Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                AppIcons.emailSuccess,
                size: 40,
                color: AppColors.success,
              ),
              const SizedBox(height: 10),
              Text(
                LocaleKeys.phrase_email_sent,
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              onPressed: () {
                Get.back(
                  closeOverlays: true,
                );
                // Get.offNamedUntil(page, (route) => false)
              },
              child: Text(
                LocaleKeys.label_back_to_login,
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      final result = await authRepository.forgotPassword(
        emailController.text.trim(),
      );
      stopLoading();

      if (result == true) {
        await showSuccessDialog();
      }
    }
  }
}