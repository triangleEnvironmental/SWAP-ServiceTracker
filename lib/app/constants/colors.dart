import 'package:flutter/material.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/utils/index.dart';

class AppColors {
  static String toHex(Color color) {
    var hex = color.red.toRadixString(16).padLeft(2, '0') + color.green.toRadixString(16).padLeft(2, '0') + color.blue.toRadixString(16).padLeft(2, '0');
    return hex.toUpperCase();
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const primaryColor = Color(0xFF419ED9);
  static final primaryMaterialColor = generateMaterialColor(color: primaryColor);
  static final accentMaterialColor = MaterialAccentColor(
    primaryColor.value,
    <int, Color>{
      100: primaryMaterialColor[100]!,
      200: primaryMaterialColor[200]!,
      400: primaryMaterialColor[400]!,
      700: primaryMaterialColor[700]!,
    },
  );

  static final shadowColor = Colors.black.withOpacity(0.8);
  static final moreShadowColor = Colors.black.withOpacity(1);
  static const contrastTextColor = Colors.white; // Contrast color to primary color

  static const backgroundColor = Color(0xfff6f6f6);
  static const darBackgroundColor = Color(0xff1f1f1f);

  static const lightBackground = Color(0xfff3f3f3);
  static const darkBackground = Color(0xffe5e5e5);
  static const disabledButton = Color(0xffc6c6c6);
  static const disabledTonalButton = Color(0x11000000);
  static const greyText = Color(0xff878787);
  static const lineColor = Color(0xffb8b8b8);

  static const red = Color(0xffff4545);
  static const blue = Color(0xFF19A2FF);
  static const green = Color(0xFF5ABA61);
  static const yellow = Color(0xffffca07);

  static const info = blue;
  static const success = green;
  static const danger = red;
  static const warning = yellow;

  static Color backgroundContrastColor(BuildContext context) => context.brightness(Colors.white, const Color(0xff101010));
}