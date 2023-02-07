import 'package:flutter/material.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

class Pill extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback? onClose;
  final VoidCallback? onTap;
  final bool small;
  final EdgeInsetsGeometry? padding;

  const Pill({
    Key? key,
    required this.text,
    this.color,
    this.onClose,
    this.onTap,
    this.small = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.primaryColor,
      borderRadius: AppDimens.borderRadiusLg,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: padding ??
                  EdgeInsets.only(
                    top: small ? 6 : 10,
                    bottom: small ? 6 : 10,
                    left: 13,
                  ),
              child: Text(
                text,
                style: const TextStyle(
                  color: AppColors.contrastTextColor,
                ),
              ),
            ),
          ),
          if (onClose != null)
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onClose,
                child: const Icon(
                  AppIcons.close,
                  size: 16,
                  color: AppColors.contrastTextColor,
                ),
              ),
            ).sized(38).circle
          else
            (padding != null ? 0 : 13).x,
        ],
      ),
    );
  }
}