import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  T brightness<T>(T light, T dark) {
    if (Theme.of(this).brightness == Brightness.dark) {
      return dark;
    } else {
      return light;
    }
  }
}
