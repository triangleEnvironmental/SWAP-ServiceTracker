import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/globals/fcm_helpers.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/firebase_options.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final content = "Splash Screen";
  final informationService = Get.find<InformationService>();
  var authService = Get.find<AuthService>();

  late AnimationController loadingAnimationController;
  final _animationDuration = const Duration(seconds: 1);

  setupFcm() async {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } else {
      await Firebase.initializeApp(
        name: 'waste_tracker', // Don't use space or iOS will crash
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    // await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 5554);
    await initializeFCM();
  }

  @override
  void onInit() {
    setupFcm();
    loadingAnimationController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );
    loadingAnimationController.forward();

    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(_animationDuration).then((_) {
      if (authService.isLoggedIn) {
        Get.offAllNamed(Routes.routeHome);

        final navigate = informationService.navigateNotification;
        if (navigate != null) {
          navigate();
        }
      } else {
        Get.offAllNamed(Routes.routeLogin);
      }
      informationService.splashScreenLoaded = true;
    });
    super.onReady();
  }

  @override
  void onClose() {
    loadingAnimationController.dispose();
    super.onClose();
  }
}
