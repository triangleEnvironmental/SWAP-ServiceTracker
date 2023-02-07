
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ReportCardItem extends StatelessWidget {
  final Report report;
  final GestureTapCallback? onTap;

  const ReportCardItem(
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
        borderRadius: AppDimens.borderRadiusMd,
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (report.medias != null && report.medias!.isNotEmpty)
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: AppDimens.radiusMd,
                  ),
                  child: report.medias!.first.widget(),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar(report.reporter?.profilePhotoUrl).sized(40).circle.paddingOnly(right: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                if (report.createdAt != null)
                                  RichText(
                                    textScaleFactor: Get.textScaleFactor,
                                    text: TextSpan(
                                      style: Get.textTheme.bodyText2?.copyWith(
                                        color: AppColors.greyText,
                                      ),
                                      children: [
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
                        ],
                      ),
                      6.y,
                      if (report.description != null)
                        Text(
                          report.description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Get.textTheme.bodyText2?.copyWith(
                            color: AppColors.greyText,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ).paddingAll(8),
          ],
        ),
      ),
    );
  }
}