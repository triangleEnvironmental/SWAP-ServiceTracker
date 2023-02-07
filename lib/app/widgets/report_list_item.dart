import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ReportListItem extends StatelessWidget {
  final Report report;
  final GestureTapCallback? onTap;

  const ReportListItem(
    this.report, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppDimens.borderRadiusMd,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: UserAvatar(
                  report.reporter?.profilePhotoUrl,
                  defaultAsset: AppStrings.avatarPlaceholder,
                ).sized(38).circle,
              ).paddingAll(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        String? displayName = report.reporter?.fullName;
                        bool hasName = false;
                        if (report.reporter == null) {
                          displayName = LocaleKeys.label_anonymous;
                        } else if (displayName == null || displayName.isEmpty) {
                          displayName = LocaleKeys.label_no_name;
                        } else {
                          hasName = true;
                        }
                        return Text(
                          displayName,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.subtitle1?.copyWith(
                            // color: hasName ? null : AppColors.greyText,
                            fontWeight: hasName ? FontWeight.bold : FontWeight.normal,
                            // fontStyle: hasName ? null : FontStyle.italic,
                          ),
                        );
                      },
                    ),
                    // if (report.description != null)
                    //   Text(
                    //     report.description!,
                    //     overflow: TextOverflow.ellipsis,
                    //     style: Get.textTheme.subtitle1?.copyWith(
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    RichText(
                      textScaleFactor: Get.textScaleFactor,
                      text: TextSpan(
                        style: Get.textTheme.bodyText2?.copyWith(
                          color: AppColors.greyText,
                        ),
                        children: [
                          if (report.createdAt != null)
                            TextSpan(
                              text: displayReadableDate(report.createdAt!),
                              style: const TextStyle(
                                fontSize: 11,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (report.assigner != null)
                      RichText(
                        textScaleFactor: Get.textScaleFactor,
                        text: TextSpan(
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "${LocaleKeys.label_assigned_by} : ",
                            ),
                            TextSpan(
                              text: report.assigner!.fullName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (report.status != null)
                      Container(
                        margin: 3.pv,
                        padding: 6.ph,
                        decoration: BoxDecoration(
                          color: report.status?.color != null ? AppColors.fromHex(report.status!.color!) : AppColors.primaryColor,
                          borderRadius: AppDimens.borderRadiusLg,
                        ),
                        child: Text(
                          report.status!.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    if (report.description != null)
                      Text(
                        report.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyText2?.copyWith(
                          color: AppColors.greyText,
                        ),
                      ),
                    // if (report.reporter?.fullName != null)
                    //   RichText(
                    //     textScaleFactor: Get.textScaleFactor,
                    //     text: TextSpan(
                    //       style: Get.textTheme.bodyText2?.copyWith(
                    //         color: AppColors.greyText,
                    //       ),
                    //       children: [
                    //         TextSpan(
                    //           text: '${LocaleKeys.label_by_person} ',
                    //         ),
                    //         TextSpan(
                    //           text: report.reporter!.fullName!,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                  ],
                ).marginSymmetric(
                  vertical: 10,
                ),
              ),
              10.x,
              if (report.medias != null && report.medias!.isNotEmpty)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: SizedBox(
                    width: min(80, Get.width / 4),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        right: AppDimens.radiusMd,
                      ),
                      child: report.medias!.first.widget(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
