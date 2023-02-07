import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/report/moderation_history/controllers/moderation_history_controller.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ReportModerationHistoryView extends GetView<ReportModerationHistoryController> {
  const ReportModerationHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_moderation_history),
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Obx(() {
                  return Text("${LocaleKeys.label_total}: ${controller.totalReports.value}");
                }),
              ).paddingSymmetric(vertical: 6),
            ),
            PagedSliverList<int, ModerationHistory>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ModerationHistory>(
                newPageProgressIndicatorBuilder: (context) => Center(
                  child: const LoadingWidget().paddingSymmetric(vertical: 10),
                ),
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: LoadingWidget(),
                ),
                noItemsFoundIndicatorBuilder: (context) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.label_data_empty,
                        style: Get.textTheme.headline6,
                      ),
                      16.y,
                    ],
                  ),
                ),
                firstPageErrorIndicatorBuilder: (context) {
                  String errorMessage = LocaleKeys.phrase_not_your_mistake;

                  errorMessage = getErrorMessage(controller.pagingController.error);

                  return ErrorView(
                    image: Image.asset(
                      AppStrings.errorImage,
                      width: Get.width * 0.8,
                    ),
                    title: LocaleKeys.label_something_went_wrong,
                    description: errorMessage,
                    bottom: FilledButton(
                      onPressed: () {
                        controller.pagingController.refresh();
                      },
                      icon: const Icon(AppIcons.refresh),
                      child: Text(LocaleKeys.button_try_again),
                    ),
                  );
                },
                itemBuilder: (context, moderation, index) {
                  return Stack(
                    children: [
                      Card(
                        margin: EdgeInsets.zero,
                        surfaceTintColor: Colors.white,
                        child: InkWell(
                          borderRadius: AppDimens.borderRadiusMd,
                          onTap: (moderation.report?.id != null)
                              ? () {
                                  Get.toNamed(
                                    Routes.routeReportDetail,
                                    arguments: {
                                      'id': moderation.report!.id,
                                    },
                                    preventDuplicates: false,
                                  );
                                }
                              : null,
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                6.x,
                                if (moderation.report != null && (moderation.report!.medias?.isNotEmpty ?? false)) ...[
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 100,
                                    ),
                                    child: SizedBox(
                                      width: min(80, Get.width / 4),
                                      child: ClipRRect(
                                        borderRadius: AppDimens.borderRadiusSm,
                                        child: moderation.report!.medias!.first.widget(),
                                      ),
                                    ),
                                  ).marginSymmetric(
                                    vertical: 6,
                                  ),
                                  4.x,
                                ],
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (moderation.report?.description != null)
                                        Text(
                                          moderation.report!.description!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Get.textTheme.subtitle1?.copyWith(
                                            fontWeight: FontWeight.bold,
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
                                  ).paddingOnly(
                                    top: 12,
                                    left: 6,
                                    bottom: 12,
                                    right: 12,
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
                  ).marginSymmetric(
                    horizontal: AppDimens.marginHorizontal,
                    vertical: 5,
                  );
                  // return ReportListItem(
                  //   report,
                  //   onTap: () {
                  //     Get.bottomSheet(
                  //       ReportPreviewWidget(
                  //         report,
                  //         onDelete: () {
                  //           removeDataFromPageList<Report>(controller.pagingController, (item) => item == report);
                  //         },
                  //       ),
                  //       isScrollControlled: true,
                  //     );
                  //   },
                  // ).marginSymmetric(
                  //   horizontal: AppDimens.marginHorizontal,
                  //   vertical: 5,
                  // );
                },
              ),
            ),
            40.y.sliver,
          ],
        ),
      ),
    );
  }
}
