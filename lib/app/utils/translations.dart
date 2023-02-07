import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/locales/en.dart';
import 'package:moderator_app/locales/km.dart';

extension RedoTranslation on String {
  String get ttr {
    if (!devMode) {
      return tr;
    }
    final translations = AppTranslations().keys;
    final keys = translations.keys.toList();
    var locale = Get.locale;
    if (!keys.contains(locale?.languageCode)) {
      locale = AppValues.fallbackLocale;
    }

    if (!translations.containsKey(locale?.languageCode) || !translations[locale?.languageCode]!.containsKey(this)) {
      debugPrint("Cannot find translation for $this");
      return this;
    }

    return translations[locale?.languageCode]![this]!;
  }
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> keys = {
    'en': enUS,
    'km': kmKH,
  };
}
