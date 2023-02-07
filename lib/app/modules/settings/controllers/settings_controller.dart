import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/globals/fcm_helpers.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/locales/index.dart';

class SettingsController extends GetxController {
  final settingsService = Get.find<SettingsService>();
  final authService = Get.find<AuthService>();
  final authRepository = AuthRepository();

  onEditProfile() {
    Get.toNamed(Routes.routeProfile);
  }

  changePassword() async {
    Get.toNamed(Routes.routeChangePassword);
  }

  onLogOut() async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.label_log_out,
      content: LocaleKeys.phrase_log_out,
    );

    if (confirm) {
      authRepository.logout();
      authService.clear();
      revokeFcmToken();
      Get.offAllNamed(Routes.routeLogin);
    }
  }

  login() {
    Get.toNamed(Routes.routeLogin);
  }

  changeBrightness() {
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      settingsService.updateBrightness(Brightness.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      settingsService.updateBrightness(Brightness.dark);
    }
  }
}