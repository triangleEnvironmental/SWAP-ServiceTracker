import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/utils/index.dart';

import 'index.dart';

class AppValues {
  static const fallbackLocale = Locale('en', 'US');

  static const LatLng defaultLatLng = LatLng(11.576081018292571, 104.92310797039636);

  static Brightness contrastBright = estimateBrightnessForColor(AppColors.contrastTextColor);

  static get primaryColorAppBarTheme => Get.theme.copyWith(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: contrastBright,
          ),
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          titleTextStyle: Get.textTheme.headline6!.copyWith(
            color: AppColors.contrastTextColor,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.contrastTextColor,
          ),
        ),
      );
}
