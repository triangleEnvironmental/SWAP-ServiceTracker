import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/notification/preset/controllers/preset_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class NotificationPresetView extends GetView<NotificationPresetController> {
  const NotificationPresetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_select_notification_preset),
      ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Obx(() {
                  return Text("${LocaleKeys.label_total}: ${controller.totalPresets.value}");
                }),
              ).paddingSymmetric(vertical: 6),
            ),
            PagedSliverList<int, NotificationPreset>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<NotificationPreset>(
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
                itemBuilder: (context, preset, index) {
                  return Card(
                    surfaceTintColor: AppColors.backgroundContrastColor(context),
                    margin: EdgeInsets.zero,
                    child: InkWell(
                      borderRadius: AppDimens.borderRadiusMd,
                      onTap: () {
                        Get.back(
                          result: preset,
                          closeOverlays: true,
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            AppIcons.choice,
                            color: AppColors.primaryColor,
                          ),
                          8.x,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (preset.title != null)
                                  Text(
                                    preset.title!,
                                    style: Get.textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (preset.description != null) Text(preset.description!),
                                if (preset.title == null && preset.description == null) const Text('No Content'),
                              ],
                            ),
                          ),
                        ],
                      ).marginAll(10),
                    ),
                  ).marginSymmetric(
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
  }
}
