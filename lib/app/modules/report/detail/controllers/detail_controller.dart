import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/modules/report/detail/views/comments_sliver_list.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:timelines/timelines.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class _ModerationTimeLine extends StatelessWidget {
  final Report report;
  final ScrollController controller;

  const _ModerationTimeLine(
    this.report, {
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusLg,
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SectionTitle(
            icon: AppIcons.moderationHistory,
            label: LocaleKeys.label_moderation_history,
            trailing: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                LocaleKeys.button_close,
                style: const TextStyle(
                  color: AppColors.danger,
                ),
              ),
            ),
          ).marginOnly(
            left: AppDimens.marginHorizontal,
          ),
          Expanded(
            child: Timeline.tileBuilder(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              controller: controller,
              theme: TimelineThemeData(
                nodePosition: 10 / Get.width,
                nodeItemOverlap: true,
                connectorTheme: const ConnectorThemeData(
                  color: AppColors.primaryColor,
                  thickness: 1,
                ),
              ),
              builder: TimelineTileBuilder.connected(
                contentsAlign: ContentsAlign.basic,
                indicatorBuilder: (context, index) {
                  if (index == (report.moderationHistories?.length ?? 0)) {
                    return UserAvatar(
                      report.reporter?.profilePhotoUrl,
                      defaultAsset: AppStrings.avatarPlaceholder,
                    ).sized(40).circle;
                  }

                  final profile = report.moderationHistories![index].moderator?.profilePhotoUrl;
                  return UserAvatar(
                    profile,
                    defaultAsset: AppStrings.avatarPlaceholder,
                  ).sized(40).circle;
                },
                connectorBuilder: (context, index, _) => const SolidLineConnector(
                  thickness: 1,
                  color: AppColors.primaryColor,
                ),
                contentsBuilder: (context, index) {
                  if (index == (report.moderationHistories?.length ?? 0)) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              report.reporter?.fullName ?? LocaleKeys.label_no_name,
                              style: Get.textTheme.subtitle1?.copyWith(
                                color: report.reporter?.fullName == null ? AppColors.greyText : null,
                                fontWeight: report.reporter?.fullName == null ? null : FontWeight.bold,
                                // fontStyle: report.reporter?.fullName == null ? FontStyle.italic : null,
                              ),
                            ),
                            if (report.createdAt != null)
                              Text(
                                displayReadableDate(report.createdAt!),
                                style: const TextStyle(
                                  color: AppColors.greyText,
                                  fontSize: 12,
                                ),
                              ),
                            4.y,
                            RichText(
                              textScaleFactor: Get.textScaleFactor,
                              text: TextSpan(
                                style: Get.textTheme.bodyText2,
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.label_created_this_report,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final moderation = report.moderationHistories![index];
                  return Stack(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox.expand(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  moderation.moderator?.fullName ?? LocaleKeys.label_no_name,
                                  style: Get.textTheme.subtitle1?.copyWith(
                                    color: moderation.moderator?.fullName == null ? AppColors.greyText : null,
                                    fontWeight: moderation.moderator?.fullName == null ? null : FontWeight.bold,
                                    // fontStyle: moderation.moderator?.fullName == null ? FontStyle.italic : null,
                                  ),
                                ),
                                if (moderation.createdAt != null)
                                  Text(
                                    displayReadableDate(moderation.createdAt!),
                                    style: const TextStyle(
                                      color: AppColors.greyText,
                                      fontSize: 12,
                                    ),
                                  ),
                                4.y,
                                RichText(
                                  textScaleFactor: Get.textScaleFactor,
                                  text: TextSpan(
                                    style: Get.textTheme.bodyText2,
                                    children: [
                                      if (moderation.fromStatus != null)
                                        WidgetSpan(
                                          baseline: TextBaseline.alphabetic,
                                          alignment: PlaceholderAlignment.middle,
                                          child: Container(
                                            margin: 3.pv,
                                            padding: 6.ph,
                                            decoration: BoxDecoration(
                                              color: moderation.fromStatus?.color != null ? AppColors.fromHex(moderation.fromStatus!.color!) : null,
                                              borderRadius: AppDimens.borderRadiusLg,
                                            ),
                                            child: Text(
                                              moderation.fromStatus!.name,
                                              style: Get.textTheme.bodySmall?.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (moderation.fromStatus != null && moderation.toStatus != null)
                                        const WidgetSpan(
                                          baseline: TextBaseline.alphabetic,
                                          alignment: PlaceholderAlignment.middle,
                                          child: Icon(
                                            AppIcons.arrowRight,
                                          ),
                                        ),
                                      if (moderation.toStatus != null)
                                        WidgetSpan(
                                          baseline: TextBaseline.alphabetic,
                                          alignment: PlaceholderAlignment.middle,
                                          child: Container(
                                            margin: 3.pv,
                                            padding: 6.ph,
                                            decoration: BoxDecoration(
                                              color: moderation.toStatus?.color != null ? AppColors.fromHex(moderation.toStatus!.color!) : null,
                                              borderRadius: AppDimens.borderRadiusLg,
                                            ),
                                            child: Text(
                                              moderation.toStatus!.name,
                                              style: Get.textTheme.bodySmall?.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (moderation.masterNotification != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              Get.defaultDialog(
                                cancel: FilledTonalButton(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
                                  child: Text(LocaleKeys.button_close),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ).marginOnly(bottom: 15),
                                titlePadding: const EdgeInsets.all(16),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.marginHorizontal,
                                ),
                                title: moderation.masterNotification!.title,
                                titleStyle: Get.textTheme.subtitle1?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                content: moderation.masterNotification?.description != null
                                    ? Text(
                                        moderation.masterNotification!.description!,
                                        textAlign: TextAlign.center,
                                      )
                                    : null,
                              );
                            },
                            iconSize: 16,
                            icon: const Icon(AppIcons.notificationMessage),
                          ),
                        ),
                    ],
                  );
                },
                itemCount: (report.moderationHistories?.length ?? 0) + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportDetailController extends GetxController {
  final reportRepository = ReportRepository();
  Rx<Report?> reportDetail = Rx(null);
  final reportId = Get.arguments?['id'] ?? 0;
  late Rx<Future<Report>> reportFuture;
  final GlobalKey<CommentSliverListState> commentListKey = GlobalKey();

  onAssign() async {
    Get.toNamed(
      Routes.routeAssignmentCreate,
      arguments: {
        'reportId': reportId,
        'report': reportDetail.value,
      },
    );
  }

  writeComment() async {
    final result = await Get.toNamed(
      Routes.routeWriteComment,
      arguments: {
        'report': reportDetail.value,
      },
    );

    if (result is Comment) {
      commentListKey.currentState?.refresh();
    }
  }

  changeStatus() async {
    final result = await Get.toNamed(
      Routes.routeChangeReportStatus,
      arguments: {
        'report': reportDetail.value,
      },
    );
    if (result is Report) {
      refreshReport();
    }
  }

  Future<Report> fetchReport() async {
    final report = await reportRepository.detail(reportId);
    reportDetail.value = report;
    return report;
  }

  deleteReport() async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.label_delete_this_report,
      content: LocaleKeys.phrase_delete_report,
    );

    if (confirm) {
      startLoading();
      final result = await reportRepository.deleteReport(reportId);
      stopLoading();

      if (result == true) {
        reportFuture.value = fetchReport();
        onDeleteDataInDetailPage();
      }
    }
  }

  viewModerationHistory() async {
    if (reportDetail.value == null) {
      return;
    }

    Get.bottomSheet(
      DraggableScrollableSheet(
        builder: (context, scrollController) => _ModerationTimeLine(
          reportDetail.value!,
          controller: scrollController,
        ),
        maxChildSize: (Get.height - Get.mediaQuery.padding.vertical) / Get.height,
        initialChildSize: 0.7,
      ),
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
    );
  }

  Future refreshReport() async {
    reportFuture.value = fetchReport();
    commentListKey.currentState?.refresh();
    await reportFuture.value;
  }

  @override
  void onInit() {
    reportFuture = fetchReport().obs;
    super.onInit();
  }
}