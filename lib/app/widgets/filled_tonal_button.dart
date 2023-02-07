import 'package:flutter/material.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

class FilledTonalButton extends StatelessWidget {
  final Widget? icon;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final Color? color;

  const FilledTonalButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.padding,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: padding,
        minimumSize: const Size(40, 40),
        backgroundColor: onPressed == null ? AppColors.disabledTonalButton : (color ?? AppColors.primaryColor).tonal,
        primary: onPressed == null ? AppColors.greyText : (color ?? AppColors.primaryColor),
      ),
      onPressed: onPressed,
      child: Builder(
        builder: (context) {
          if (icon != null) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon!,
                8.x,
                child,
              ],
            );
          }
          return child;
        },
      ),
    );
  }
}

