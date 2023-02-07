import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/services/index.dart';

class ProcessDataState {
  bool isProcessing = false;

  process(FutureOr Function() callback) async {
    try {
      isProcessing = true;
      await callback();
    } finally {
      isProcessing = false;
    }
  }
}

class InformationService extends GetxService {
  final reportRepository = ReportRepository();

  // final notificationRepository = NotificationRepository();
  final locationService = Get.find<LocationService>();
  final authService = Get.find<AuthService>();
  ValueNotifier<ReportFilterOption?> reportFilterOption = ValueNotifier(null);
  ValueNotifier<int?> unreadNotificationCount = ValueNotifier(null);
  var reportFilterOptionProcessor = ProcessDataState();
  var availableSectorProcessor = ProcessDataState();
  var unreadNotificationCountProcessor = ProcessDataState();

  bool splashScreenLoaded = false;
  Function? navigateNotification;

  decreaseNotificationCount() async {
    if (unreadNotificationCount.value != null) {
      unreadNotificationCount.value = max(unreadNotificationCount.value! - 1, 0);
    }
  }

  increaseNotificationCount() async {
    if (unreadNotificationCount.value != null) {
      unreadNotificationCount.value = unreadNotificationCount.value! + 1;
    }
  }

  fillReportOption() async {
    if (authService.isLoggedIn) {
      reportFilterOptionProcessor.process(() async {
        reportFilterOption.value = await reportRepository.getFilterOptions();
      });
    }
  }

  // fillUnreadNotificationCount() async {
  //   if (authService.isLoggedIn) {
  //     unreadNotificationCountProcessor.process(() async {
  //       unreadNotificationCount.value = await notificationRepository.countUnread();
  //     });
  //   }
  // }

  afterLogin() {
    // fillUnreadNotificationCount()
    fillReportOption();
  }

  init() async {
    fillReportOption();
    // fillUnreadNotificationCount();
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        if (reportFilterOption.value == null && !reportFilterOptionProcessor.isProcessing) {
          fillReportOption();
        }
        // if (/*unreadNotificationCount.value == null && */!unreadNotificationCountProcessor.isProcessing) {
        //   fillUnreadNotificationCount();
        // }
      },
    );
  }
}
