import 'package:flutter/material.dart';

extension AppNumber on num {
  SizedBox get y => SizedBox(
        height: toDouble(),
      );

  SizedBox get x => SizedBox(
        width: toDouble(),
      );

  EdgeInsetsGeometry get ph => EdgeInsets.symmetric(
        horizontal: toDouble(),
      );

  EdgeInsetsGeometry get pv => EdgeInsets.symmetric(
        vertical: toDouble(),
      );

  EdgeInsetsGeometry get p => EdgeInsets.all(toDouble());
}
