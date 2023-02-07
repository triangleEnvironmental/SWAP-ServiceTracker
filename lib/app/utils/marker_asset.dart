import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/index.dart';

class MarkerAsset {
  Map<String, Future<BitmapDescriptor>> markerBitmaps = {};
  Map<String, Future<ui.Image>> clusterMarkerUiImages = {};

  List<String> availableStatuses = ['moderation', 'in_progress', 'open', 'disapproved', 'resolved'];
  List<String> availableClusters = ['blue', 'yellow', 'red'];

  Future<Marker?> makeMarker(
    ReportMarker marker,
    GoogleMapController mapController, {
    required Function(Report report) onTapReportMarker,
  }) async {
    if (marker.cluster != null) {
      return Marker(
        icon: await getClusterMarkerBitmap(marker.cluster!.count),
        consumeTapEvents: true,
        markerId: MarkerId('c-${marker.cluster!.cid}'),
        position: marker.location.latLng,
        anchor: const Offset(0.5, 0.5),
        draggable: false,
        onTap: () async {
          LatLngBounds currentBound = await mapController.getVisibleRegion();

          var currentLatDiff = currentBound.northeast.latitude - currentBound.southwest.latitude;
          var currentLngDiff = currentBound.northeast.longitude - currentBound.southwest.longitude;
          var newLatDiff = marker.cluster!.bound.northeast.latitude - marker.cluster!.bound.southwest.latitude;
          var newLngDiff = marker.cluster!.bound.northeast.longitude - marker.cluster!.bound.southwest.longitude;

          if (currentLatDiff <= newLatDiff * 1.3 || currentLngDiff <= newLngDiff * 1.3) {
            double zoomLevel = await mapController.getZoomLevel();
            mapController.animateCamera(
              CameraUpdate.newLatLngZoom(
                marker.location.latLng,
                zoomLevel + 2,
              ),
            );
          } else {
            mapController.animateCamera(
              CameraUpdate.newLatLngBounds(
                marker.cluster!.bound,
                30,
              ),
            );
          }
        },
      );
    } else if (marker.report != null) {
      return Marker(
        icon: await getReportMarkerBitmap(marker.report!.status?.key),
        consumeTapEvents: true,
        markerId: MarkerId('r-${marker.report!.id}'),
        position: marker.location.latLng,
        draggable: false,
        onTap: () {
          onTapReportMarker(marker.report!);
        },
      );
    }
    return null;
  }

  Future<BitmapDescriptor> getReportMarkerBitmap(String? statusKey) async {
    if (markerBitmaps.containsKey(statusKey)) {
      return await markerBitmaps[statusKey]!;
    }
    String assetPath = AppStrings.mapMarkerDefault;
    if (availableStatuses.contains(statusKey)) {
      assetPath = '${AppStrings.mapMarkerPrefix}$statusKey.png';
    }

    return BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        devicePixelRatio: Get.mediaQuery.devicePixelRatio,
        size: const Size(10, 10),
      ),
      assetPath,
    );
  }

  Future<BitmapDescriptor> getClusterMarkerBitmap(int count) async {
    String key = 'red';
    if (count < 10) {
      key = 'blue';
    } else if (count < 100) {
      key = 'yellow';
    }

    double aspectRatio = Get.mediaQuery.devicePixelRatio;
    String displayText = () {
      if (count >= 1000000) {
        return '${(count / 1000000).toStringAsFixed(1)}M';
      } else if (count >= 1000) {
        return '${(count / 1000).toStringAsFixed(1)}K';
      } else {
        return '$count';
      }
    }();

    double fontSize = 16;

    if (count >= 100) {
      fontSize = 14;
    }

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder)..scale(aspectRatio / 1.25);
    final Paint paint = Paint();
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    final ui.Image img = await getClusterUiImage(key);
    canvas.drawImage(img, const Offset(0, 0), paint);

    textPainter.text = TextSpan(
      text: displayText,
      style: Get.textTheme.bodyText2?.copyWith(
        fontSize: fontSize,
        color: Colors.white,
      ),
    );

    textPainter.layout();

    double scaleSize = 50 * aspectRatio;

    textPainter.paint(
      canvas,
      Offset((19 - textPainter.width / 2), 19 - textPainter.height / 2),
    );

    final image = await pictureRecorder.endRecording().toImage(scaleSize.floor(), scaleSize.floor());

    final finalData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(finalData!.buffer.asUint8List());
  }

  Future<ui.Image> getClusterUiImage(String key) async {
    if (clusterMarkerUiImages.containsKey(key)) {
      return await clusterMarkerUiImages[key]!;
    }
    String assetPath = AppStrings.clusterMarkerDefault;
    if (availableClusters.contains(key)) {
      assetPath = '${AppStrings.clusterMarkerPrefix}$key.png';
    }
    final ByteData data = await rootBundle.load(assetPath);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
      return completer.complete(img);
    });
    final ui.Image img = await completer.future;
    return img;
  }

  init() {
    for (final statusKey in availableStatuses) {
      markerBitmaps[statusKey] = getReportMarkerBitmap(statusKey);
    }

    for (final clusterKey in availableClusters) {
      clusterMarkerUiImages[clusterKey] = getClusterUiImage(clusterKey);
    }
  }
}