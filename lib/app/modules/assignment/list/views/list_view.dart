import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/assignment/list/controllers/list_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class AssignmentListView extends GetView<AssignmentListController> {
  const AssignmentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.reportFilter,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.title_assigned_to_me),
            actions: [
              Obx(
                () => IconButton(
                  tooltip: () {
                    if (controller.isListView.value) {
                      return LocaleKeys.label_switch_to_card_view;
                    } else {
                      return LocaleKeys.label_switch_to_list_view;
                    }
                  }(),
                  onPressed: () {
                    controller.toggleListView();
                  },
                  icon: Icon(controller.isListView.value ? AppIcons.card : AppIcons.list),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: controller.informationService.reportFilterOption,
                builder: (context, option, child) {
                  if (option == null) {
                    return const SizedBox();
                  } else {
                    return IconButton(
                      tooltip: LocaleKeys.label_filter_reports,
                      onPressed: controller.onTapFilter,
                      icon: const Icon(AppIcons.filter),
                    );
                  }
                },
              ),
            ],
            bottom: controller.reportFilter.display(
              onTap: controller.onTapFilter,
            ),
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
                PagedSliverList<int, Report>(
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Report>(
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
                            LocaleKeys.label_assignment_empty,
                            style: Get.textTheme.headline6,
                          ),
                          16.y,
                          if (controller.reportFilter.hasFilter)
                            Text(
                              LocaleKeys.phrase_no_reports_match_conditions,
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText2?.copyWith(
                                color: AppColors.greyText,
                              ),
                            ),
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
                    itemBuilder: (context, report, index) {
                      return Obx(() {
                        goToReportDetail() {
                          Get.bottomSheet(
                            ReportPreviewWidget(
                              report,
                              onDelete: () {
                                removeDataFromPageList<Report>(controller.pagingController, (item) => item == report);
                              },
                            ),
                            isScrollControlled: true,
                          );
                        }

                        return controller.isListView.value
                            ? ReportListItem(
                                report,
                                onTap: goToReportDetail,
                              )
                            : ReportCardItem(
                                report,
                                onTap: goToReportDetail,
                              );
                      }).marginSymmetric(
                        horizontal: AppDimens.marginHorizontal,
                        vertical: 5,
                      );
                    },
                  ),
                ),
                40.y.sliver,
              ],
            ),
          ),
        );
      },
    );
  }
}
