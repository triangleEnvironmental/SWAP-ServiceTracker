import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';

class ErrorView extends StatelessWidget {
  final Widget image;
  final String title;
  final String? description;
  final Widget? bottom;
  final Widget? action;

  const ErrorView({
    Key? key,
    required this.image,
    required this.title,
    this.description,
    this.bottom,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                style: Get.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
              ),
              Flexible(
                flex: 3,
                child: Center(child: image),
              ),
              if (description != null)
                Flexible(
                  flex: 2,
                  child: Text(
                    description!,
                  ),
                ),
              10.y,
              if (bottom != null) bottom!,
            ],
          ),
        ),
        if (action != null) action!,
        SizedBox(
          height: Get.mediaQuery.padding.bottom + 10,
        ),
      ],
    ).paddingSymmetric(
      horizontal: AppDimens.marginHorizontal,
    );
  }
}
