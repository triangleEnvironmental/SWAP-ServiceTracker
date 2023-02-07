import 'package:flutter/material.dart';

extension AppBrightness on Brightness {
  get flip => this == Brightness.dark ? Brightness.light : Brightness.dark;
}
