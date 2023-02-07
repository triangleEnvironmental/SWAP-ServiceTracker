import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/modules/report/map/controllers/map_controller.dart';
import 'package:moderator_app/locales/index.dart';

class ReportMapView extends GetView<ReportMapController> {
  const ReportMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.reportFilter,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.title_reports),
            actions: [
              if (controller.canSwitchView)
                IconButton(
                  onPressed: controller.onSwitchView,
                  icon: const Icon(AppIcons.list),
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
          body: Obx(
            () => Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.terrain,
                  markers: controller.markers.value,
                  initialCameraPosition: controller.initialCameraPosition.value,
                  zoomControlsEnabled: true,
                  rotateGesturesEnabled: false,
                  onCameraIdle: () async {
                    controller.fetchMarkers();
                  },
                  onCameraMoveStarted: () {},
                  onMapCreated: (GoogleMapController mapController) {
                    controller.mapController.complete(mapController);
                  },
                ),
                // Positioned.fill(
                //   child: controller.isLoading.value
                //       ? const IgnorePointer(
                //           child: Center(
                //             child: LoadingWidget(),
                //           ),
                //         )
                //       : const SizedBox.shrink(),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}