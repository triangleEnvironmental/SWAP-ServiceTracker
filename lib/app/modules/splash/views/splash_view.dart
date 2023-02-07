import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: context.theme.brightness,
        statusBarIconBrightness: context.theme.brightness.flip,
      ),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppStrings.logoWhite,
                width: Get.width * 2 / 3,
              ),
              10.y,
              AnimatedBuilder(
                animation: controller.loadingAnimationController,
                builder: (BuildContext context, Widget? child) {
                  return SizedBox(
                    width: Get.width / 2,
                    child: LinearProgressIndicator(
                      minHeight: 5,
                      value: controller.loadingAnimationController.value,
                      backgroundColor: AppColors.contrastTextColor.withOpacity(0.2),
                      valueColor: const AlwaysStoppedAnimation(AppColors.contrastTextColor),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
