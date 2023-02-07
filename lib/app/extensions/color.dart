import 'package:flutter/material.dart';

extension AppColor on Color {
  get tonal => withOpacity(0.14);
  get solidTonal {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + .45).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
