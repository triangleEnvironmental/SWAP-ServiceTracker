import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/locales/index.dart';

class LabelValue extends StatelessWidget {
  final String title;
  final String? value;

  const LabelValue({
    Key? key,
    required this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        10.x,
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: value != null
                ? Text(value!)
                : Text(
                    LocaleKeys.label_na,
                    style: const TextStyle(
                      color: AppColors.greyText,
                    ),
                  ),
          ),
        ),
      ],
    ).marginSymmetric(
      vertical: 10,
    );
  }
}
