import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';

extension AppWidget on Widget {
  Widget get m => paddingSymmetric(
        horizontal: AppDimens.marginHorizontal,
      );

  Widget rounded(double radius) => ClipRRect(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: this,
        ),
      );

  Widget roundedBordered(double radius) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: AppColors.lineColor,
            width: 0.5,
          ),
        ),
        child: ClipRRect(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius - 0.5),
            child: this,
          ),
        ),
      );

  Widget get sliver => SliverToBoxAdapter(
        child: this,
      );

  Widget get bordered => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lineColor,
            width: 0.5,
          ),
        ),
        child: this,
      );

  Widget get circle => ClipOval(
        child: this,
      );

  Widget sized(double dimension) => SizedBox.square(
        dimension: dimension,
        child: this,
      );

  Widget mx(double marginX) => paddingSymmetric(
        horizontal: marginX,
      );
}
