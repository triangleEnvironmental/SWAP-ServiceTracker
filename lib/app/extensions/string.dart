import 'package:flutter/material.dart';

extension AppString on String {
  Text get text => Text(this);

  int? toInt() {
    try {
      return int.parse(this);
    } catch (e) {
      return null;
    }
  }
}
