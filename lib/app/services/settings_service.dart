import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/constants/index.dart';

class SettingsService extends GetxService {
  late bool _isDarkMode;
  late bool _isListView;
  late String _localeSetting;
  late Box _settingBox;

  Brightness get brightness => _isDarkMode ? Brightness.dark : Brightness.light;

  bool get isListView => _isListView;

  Locale get locale => Locale(_localeSetting.split('_')[0], _localeSetting.split('_')[1]);

  Future<SettingsService> init() async {
    _settingBox = await Hive.openBox(AppStrings.settingBox);
    _isDarkMode = _settingBox.get('isDarkMode') ?? false;
    _isListView = _settingBox.get('isListView') ?? true;
    _localeSetting = _settingBox.get('locale') ?? '${AppValues.fallbackLocale.languageCode}_${AppValues.fallbackLocale.countryCode}';
    return this;
  }

  updateLocale(Locale newLocale) async {
    _localeSetting = '${newLocale.languageCode}_${newLocale.countryCode}';
    _settingBox.put('locale', _localeSetting);
  }

  updateBrightness(Brightness newBrightness) async {
    _isDarkMode = newBrightness == Brightness.dark;
    _settingBox.put('isDarkMode', _isDarkMode);
  }

  setListItemView(bool isListView) async {
    _isListView = isListView;
    _settingBox.put('isListView', _isListView);
  }
}
