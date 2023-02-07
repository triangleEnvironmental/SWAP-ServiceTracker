import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moderator_app/app/constants/index.dart';

class AppThemes {
  static ThemeData getTheme(Brightness brightness) {
    if (brightness == Brightness.light) {
      return light;
    }
    return dark;
  }

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    backgroundColor: AppColors.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: AppColors.contrastTextColor,
    ),
    fontFamily: 'Nokora',
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
      // border: OutlineInputBorder(),
      // filled: true,
      // fillColor: AppColors.primaryColor.withOpacity(0.15),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.primaryMaterialColor).copyWith(secondary: AppColors.accentMaterialColor),
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primarySwatch: AppColors.primaryMaterialColor,
    backgroundColor: AppColors.darBackgroundColor,
    fontFamily: 'Nokora',
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
