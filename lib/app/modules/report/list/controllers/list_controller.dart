import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/report/map/controllers/map_controller.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';

class ReportListController extends GetxController {
  final reportRepository = ReportRepository();
  final canSwitchView = Get.arguments?['switch-view'] != 'NO';
  final informationService = Get.find<InformationService>();
  final PagingController<int, Report> pagingController = PagingController(firstPageKey: 1);
  late ReportFilter reportFilter;
  Rx<int> totalReports = 0.obs;

  onTapFilter() async {
    final result = await Get.dialog(
      Material(
        child: ReportFilterWidget(
          filter: reportFilter.clone(),
        ),
      ),
    );

    if (result is ReportFilter) {
      reportFilter.apply(result);
    }
  }

  onSwitchView() {
    Get.toNamed(
      Routes.routeReportMap,
      arguments: {
        'switch-view': 'NO',
      },
    );
  }

  Future onRefresh() async {
    nextTick(() {
      totalReports.value = 0;
    });
    pagingController.refresh();
  }

  _fetchPage(int page) async {
    try {
      final pagination = await reportRepository.listReport(
        page: page,
        filter: reportFilter,
      );
      nextTick(() {
        totalReports.value = pagination.total;
      });
      final isLastPage = !pagination.hasMorePage;
      // pagingController.appendLastPage([]);
      if (isLastPage) {
        pagingController.appendLastPage(pagination.getData());
      } else {
        final nextPageKey = pagination.currentPage + 1;
        pagingController.appendPage(pagination.getData(), nextPageKey);
      }
    } catch (error) {
      print(error);
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    if (Get.arguments is Map && Get.arguments.containsKey('filter')) {
      reportFilter = Get.arguments?['filter'];
    } else {
      if (canSwitchView) {
        reportFilter = ReportFilter();
      } else {
        final reportMapController = Get.find<ReportMapController>();
        reportFilter = reportMapController.reportFilter.clone();
      }
    }

    reportFilter.addListener(pagingController.refresh);

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    reportFilter.removeListener(pagingController.refresh);
    super.onClose();
  }
}
