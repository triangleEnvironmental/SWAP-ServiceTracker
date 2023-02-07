import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChangeReportStatusController extends GetxController {
  final informationService = Get.find<InformationService>();
  final reportRepository = ReportRepository();
  final Report report = Get.arguments?['report'];
  final Rx<bool> showPreview = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey();
  final Rx<ReportStatus?> newStatus = Rx(null);
  final TextEditingController notificationTitleController = TextEditingController();
  final TextEditingController notificationBodyController = TextEditingController();

  List<ReportStatus>? get statusOptions {
    return informationService.reportFilterOption.value?.statuses;
  }

  String get defaultNotificationTitle {
    return 'Report has been updated';
  }

  String get defaultNotificationBody {
    return 'Your report created ${report.createdAt != null ? timeago.format(report.createdAt!) : 'last time'} is now ${(newStatus.value?.nameEn ?? 'seen').toLowerCase()}';
  }

  selectPreset() async {
    final result = await Get.toNamed(
      Routes.routeNotificationPreset,
      arguments: {
        'reportId': report.id,
      },
    );
    if (result is NotificationPreset) {
      notificationTitleController.text = result.title ?? '';
      notificationBodyController.text = result.description ?? '';
    }
  }

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      var title = notificationTitleController.text.trim();
      if (title.isEmpty) {
        title = defaultNotificationTitle;
      }

      var body = notificationBodyController.text.trim();
      if (body.isEmpty) {
        body = defaultNotificationBody;
      }

      final result = await reportRepository.changeStatus(
        reportId: report.id,
        statusId: newStatus.value?.id,
        notificationTitle: title,
        notificationBody: body,
      );
      stopLoading();

      if (result is Report) {
        Get.back(
          result: result,
          closeOverlays: true,
        );
      }
    }
  }

  @override
  void onInit() {
    newStatus.value = report.status;
    super.onInit();
  }
}
