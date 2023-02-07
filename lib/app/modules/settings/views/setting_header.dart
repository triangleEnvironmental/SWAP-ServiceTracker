import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';

final _headerHeight = Get.mediaQuery.padding.top + 100 + kToolbarHeight;
const _imageHeight = 120.0;
const _imageWidth = _imageHeight;

class SettingHeader extends StatelessWidget {
  final String? imageUrl;
  final Widget profile;
  final String? fullName;

  const SettingHeader({
    Key? key,
    required this.imageUrl,
    required this.profile,
    this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: AppColors.shadowColor,
      elevation: 10,
      color: AppColors.backgroundContrastColor(context),
      borderRadius: AppDimens.borderRadiusLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (imageUrl != null) {
                viewPhoto(
                  images: [NetworkImage(imageUrl!)],
                );
              }
            },
            child: Hero(
              tag: 'USER-PROFILE',
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 3,
                  ),
                ),
                child: UserAvatar(
                  imageUrl ?? '',
                ).sized(100).circle,
              ),
            ),
          ),
          10.y,
          profile,
        ],
      ).paddingAll(16),
    ).paddingSymmetric(
      horizontal: AppDimens.marginHorizontal,
    );
  }
}