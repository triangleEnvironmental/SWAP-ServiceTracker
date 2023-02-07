import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ReportPreviewWidget extends StatelessWidget {
  final Report report;
  final Function? onDelete;

  const ReportPreviewWidget(
    this.report, {
    Key? key,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.vertical(
        top: AppDimens.radiusLg,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar(
                  report.reporter?.profilePhotoUrl,
                  defaultAsset: AppStrings.avatarPlaceholder,
                ).sized(38).circle.paddingOnly(
                      left: 10,
                      right: 8,
                    ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                              color: hasName ? null : AppColors.greyText,
                              fontWeight: hasName ? FontWeight.bold : FontWeight.normal,
                              // fontStyle: hasName ? null : FontStyle.italic,
                            ),
                          );
                        },
                      ),
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
                ),
                FilledButton(
                  child: Text(
                    LocaleKeys.label_details,
                  ),
                  onPressed: () {
                    Get.back();
                    final arguments = <String, dynamic>{
                      'id': report.id,
                    };
                    if (onDelete != null) {
                      arguments['onDelete'] = onDelete;
                    }
                    Get.toNamed(
                      Routes.routeReportDetail,
                      arguments: arguments,
                      preventDuplicates: false,
                    );
                  },
                ).paddingSymmetric(
                  horizontal: 10,
                ),
              ],
            ),
            10.y,
            if (report.sector != null || report.reportType != null)
              RichText(
                textScaleFactor: Get.textScaleFactor,
                text: TextSpan(
                  style: Get.textTheme.bodyText2,
                  children: [
                    if (report.sector != null) ...[
                      WidgetSpan(
                        child: report.sector!.icon.sized(20),
                      ),
                      TextSpan(
                        text: ' ${report.sector!.name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (report.reportType != null)
                        const TextSpan(
                          text: ' : ',
                        ),
                    ] else if (report.reportType != null)
                      WidgetSpan(
                        baseline: TextBaseline.alphabetic,
                        alignment: PlaceholderAlignment.middle,
                        child: const Icon(
                          AppIcons.reportType,
                          size: 18,
                        ).marginOnly(right: 4),
                      ),
                    if (report.reportType != null)
                      TextSpan(
                        text: report.reportType!.name,
                      ),
                  ],
                ),
              ).marginSymmetric(
                horizontal: 10,
              ),
            if (report.description != null)
              Text(
                report.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ).paddingSymmetric(
                horizontal: 12,
                vertical: 18,
              ),
            // Container(
            //   margin: const EdgeInsets.symmetric(
            //     horizontal: 10,
            //     vertical: 12,
            //   ),
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 10,
            //     vertical: 12,
            //   ),
            //   decoration: const BoxDecoration(
            //     color: AppColors.lightBackground,
            //     border: Border(
            //       left: BorderSide(
            //         color: AppColors.darkBackground,
            //         width: 4,
            //       ),
            //     ),
            //   ),
            //   child: Text(
            //     report.description!,
            //     maxLines: 3,
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // ),
            if (report.medias?.isNotEmpty ?? false)
              SizedBox(
                height: 90,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      for (final media in report.medias!)
                        UserAvatar(
                          media.mediaUrl,
                          previewIndex: report.medias!.indexOf(media),
                          previewImages: report.medias!.map((e) => NetworkImage(e.mediaUrl)).toList(),
                          defaultAsset: AppStrings.reportImagePlaceholder,
                        ).sized(90).roundedBordered(8).paddingOnly(
                              right: 10,
                            ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
