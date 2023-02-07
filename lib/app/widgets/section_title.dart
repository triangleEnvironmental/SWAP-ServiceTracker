import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

class SectionTitle extends StatelessWidget {
  final IconData? icon;
  final String label;
  final bool wrapped;
  final Widget? trailing;
  final Color? textColor;

  const SectionTitle({
    Key? key,
    this.icon,
    required this.label,
    this.wrapped = false,
    this.trailing,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: wrapped ? 10 : 15,
            ),
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: textColor,
                  ).marginOnly(right: 8),
                Text(
                  label,
                  style: Get.textTheme.subtitle1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );

    if (wrapped) {
      return Container(
        color: AppColors.primaryColor.tonal,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.marginHorizontal,
        ),
        child: title,
      );
    } else {
      return title;
    }
  }
}
