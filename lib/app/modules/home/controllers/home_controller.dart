import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/widgets/index.dart';

class HomeController extends GetxController {
  final authService = Get.find<AuthService>();
  final settingService = Get.find<SettingsService>();
  final pageRepository = PageRepository();
  late Rx<bool> isListView;
  late Rx<Future<HomePageData?>> future;

  goToReportList(ReportFilter reportFilter) async {
    Get.toNamed(
      Routes.routeReportList,
      arguments: {
        'filter': reportFilter,
      },
    );
  }

  onTapFilter() async {
    final result = await Get.dialog(
      Material(
        child: ReportFilterWidget(
          filter: ReportFilter(),
        ),
      ),
    );

    if (result is ReportFilter) {
      goToReportList(result);
    }
  }

  toggleListView() {
    isListView.value = !isListView.value;
    settingService.setListItemView(isListView.value);
  }

  Future retry() async {
    future.value = pageRepository.homePageData();
    return await future.value;
  }

  @override
  void onInit() {
    isListView = settingService.isListView.obs;
    future = pageRepository.homePageData().obs;

    super.onInit();
  }
}
