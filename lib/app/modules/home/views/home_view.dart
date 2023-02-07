import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: HomeLayout(
        routeName: Routes.routeHome,
        child: ValueListenableBuilder(
          valueListenable: controller.authService.listenable,
          builder: (context, _, __) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Builder(
                  builder: (context) {
                    if (controller.authService.user?.institution != null) {
                      final institution = controller.authService.user!.institution!;
                      return Row(
                        children: [
                          UserAvatar(
                            institution.logoUrl,
                            defaultAsset: AppStrings.municipalityPlaceholder,
                          ).sized(40),
                          10.x,
                          Expanded(
                            child: Text(
                              institution.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    }
                    return Row(
                      children: [
                        Image.asset(AppStrings.logo).sized(40),
                        10.x,
                        const Expanded(
                          child: Text(
                            AppStrings.appName,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.routeSettings);
                    },
                    tooltip: LocaleKeys.tooltip_settings,
                    icon: const Icon(AppIcons.profile),
                  ),
                ],
                centerTitle: false,
              ),
              body: RefreshIndicator(
                onRefresh: controller.retry,
                child: Obx(
                  () {
                    return FutureBuilder<HomePageData?>(
                      future: controller.future.value,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data!;
                          return ListView(
                            children: [
                              22.y,
                              Grid(
                                crossAxisCount: 2,
                                childAspectRatio: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: [
                                  for (final counting in data.statusCountings)
                                    Card(
                                      surfaceTintColor: Colors.white,
                                      margin: EdgeInsets.zero,
                                      child: InkWell(
                                        borderRadius: AppDimens.borderRadiusMd,
                                        onTap: () {
                                          controller.goToReportList(
                                            ReportFilter()..statuses = [counting.status],
                                          );
                                        },
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      counting.status.name,
                                                    ),
                                                    Text(
                                                      '${counting.count}',
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                counting.status.icon,
                                                size: 28,
                                                color: counting.status.color != null ? AppColors.fromHex(counting.status.color!) : AppColors.primaryColor,
                                              ),
                                            ],
                                          ).paddingAll(8),
                                        ),
                                      ),
                                    ),
                                ],
                              ).m,
                              16.y,
                              SectionTitle(
                                icon: AppIcons.report,
                                label: LocaleKeys.label_latest_reports,
                                trailing: Row(
                                  children: [
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
                                    IconButton(
                                      tooltip: LocaleKeys.label_filter_reports,
                                      onPressed: controller.onTapFilter,
                                      icon: const Icon(AppIcons.filter),
                                    ),
                                  ],
                                ),
                              ).m,
                              10.y,
                              for (final report in data.recentReports)
                                Obx(() {
                                  goToReportDetail() {
                                    Get.toNamed(
                                      Routes.routeReportDetail,
                                      arguments: {
                                        'id': report.id,
                                        'onDelete': () {
                                          data.recentReports.remove(report);
                                          controller.future.value = Future.value(
                                            data,
                                          );
                                        }
                                      },
                                      preventDuplicates: false,
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
                                }).marginOnly(
                                  left: AppDimens.marginHorizontal,
                                  right: AppDimens.marginHorizontal,
                                  bottom: 10,
                                ),
                              BottomButton(
                                buttonType: ButtonType.text,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      LocaleKeys.label_see_all,
                                    ),
                                    const Icon(AppIcons.more),
                                  ],
                                ),
                                onPressed: () {
                                  Get.toNamed(Routes.routeReportList);
                                },
                              ).m,
                              20.y,
                            ],
                          );
                        } else if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: LoadingWidget(),
                          );
                        }
                        return ErrorView(
                          image: Image.asset(AppStrings.errorImage),
                          title: LocaleKeys.title_failed_to_get_data,
                          description: getErrorMessage(snapshot.error),
                          action: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FilledButton(
                                onPressed: controller.retry,
                                child: Text(LocaleKeys.button_retry),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
