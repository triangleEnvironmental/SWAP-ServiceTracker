import 'dart:async';
import 'dart:ui' as ui;

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/report/list/controllers/list_controller.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/utils/marker_asset.dart';
import 'package:moderator_app/app/widgets/index.dart';

class ReportMapController extends GetxController {
  final informationService = Get.find<InformationService>();
  final reportRepository = ReportRepository();
  final markerAsset = MarkerAsset();
  late ReportFilter reportFilter;
  final canSwitchView = Get.arguments?['switch-view'] != 'NO';

  Rx<bool> isLoading = true.obs;
  RxSet<Marker> markers = RxSet();
  late Rx<CameraPosition> initialCameraPosition;
  Completer<GoogleMapController> mapController = Completer();

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

  int fetchCounter = 0;

  fetchMarkers() async {
    isLoading.value = true;
    var currentRequestCounter = ++fetchCounter;
    EasyDebounce.cancel('FETCH_MAP');
    EasyDebounce.debounce(
      'FETCH_MAP',
      const Duration(milliseconds: 50),
      () async {
        final GoogleMapController controller = await mapController.future;
        LatLngBounds bounds = await controller.getVisibleRegion();
        double zoomLevel = await controller.getZoomLevel();
        final result = await reportRepository.mapQuery(
          bounds: bounds,
          zoom: zoomLevel,
          filter: reportFilter,
        );
        if (result != null && currentRequestCounter == fetchCounter) {
          markers.assignAll(
            (await Future.wait(
              result.map(
                (marker) async {
                  late Marker? gMapMarker;
                  gMapMarker = await markerAsset.makeMarker(
                    marker,
                    controller,
                    onTapReportMarker: (Report report) {
                      Get.bottomSheet(
                        ReportPreviewWidget(
                          report,
                          onDelete: () {
                            print("Remove it");
                            markers.remove(gMapMarker);
                          },
                        ),
                        isScrollControlled: true,
                      );
                    },
                  );
                  return gMapMarker;
                },
              ),
            ))
                .whereType<Marker>(),
          );
          isLoading.value = false;
        }
      },
    );
  }

  onSwitchView() {
    Get.toNamed(
      Routes.routeReportList,
      arguments: {
        'switch-view': 'NO',
      },
    );
  }

  @override
  void onInit() {
    markerAsset.init();
    if (Get.arguments is Map && Get.arguments.containsKey('filter')) {
      reportFilter = Get.arguments?['filter'];
    } else {
      if (canSwitchView) {
        reportFilter = ReportFilter();
      } else {
        final reportListController = Get.find<ReportListController>();
        reportFilter = reportListController.reportFilter.clone();
      }
    }

    // fetchMarkers(); // It will detect bound as zero
    reportFilter.addListener(fetchMarkers);

    initialCameraPosition = CameraPosition(
      target: getDefaultLatLng(),
      zoom: 12,
    ).obs;
    super.onInit();
  }

  @override
  void onClose() {
    reportFilter.removeListener(fetchMarkers);
    super.onClose();
  }
}
