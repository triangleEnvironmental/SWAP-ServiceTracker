import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/globals/index.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';
import 'dart:ui' as ui;

class PickLocationPage extends StatefulWidget {
  final LatLng? initialLocation;
  final String? title;
  final bool needAddress;
  final bool readOnly;

  const PickLocationPage({
    Key? key,
    this.initialLocation,
    this.title,
    this.readOnly = false,
    this.needAddress = false,
  }) : super(key: key);

  @override
  State<PickLocationPage> createState() => _PickLocationPageState();
}

class _PickLocationPageState extends State<PickLocationPage> {
  final locationService = Get.find<LocationService>();
  final authService = Get.find<AuthService>();

  late LatLng initialLocation;
  late CameraPosition initialCameraPosition;
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  final GlobalKey<AnimatedMarkerState> _markerKey = GlobalKey();
  String? address;
  bool loadingAddress = false;
  bool isDragging = false;
  late LatLng markerLocation;

  Future<BitmapDescriptor?> get markerIcon async {
    ByteData data = await rootBundle.load(AppStrings.mapMarkerDefault); //markerImage);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: (25 * Get.mediaQuery.devicePixelRatio).toInt(),
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    var buffer = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    var bytes = buffer?.buffer.asUint8List();
    if (bytes != null) {
      return BitmapDescriptor.fromBytes(bytes);
    }
    return null;
  }

  @override
  void initState() {
    initialLocation = widget.initialLocation ?? getDefaultLatLng();
    markerLocation = initialLocation;
    initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 17,
    );
    if (widget.readOnly) {
          () async {
        var icon = await markerIcon;
        if (icon != null) {
          setState(() {
            markers.add(
              Marker(
                markerId: const MarkerId('initialLocation'),
                position: initialLocation,
                icon: icon,
              ),
            );
          });
        }
      }();
    }

    super.initState();
  }

  Future<LatLng> getMarkerLocation() async {
    var controller = await _controller.future;
    // if (Platform.isIOS) {
    //   print(Get.mediaQuery.devicePixelRatio);
    //   return await controller.getLatLng(
    //     ScreenCoordinate(
    //       x: (Get.width ~/ 2),
    //       y: ((Get.height - Get.mediaQuery.padding.vertical - kToolbarHeight) ~/ 2),
    //     ),
    //   );
    // } else {
    //   return await controller.getLatLng(
    //     ScreenCoordinate(
    //       x: (Get.width * Get.mediaQuery.devicePixelRatio ~/ 2),
    //       y: ((Get.height - Get.mediaQuery.padding.vertical - kToolbarHeight) * Get.mediaQuery.devicePixelRatio ~/ 2),
    //     ),
    //   );
    // }
    LatLngBounds visibleRegion = await controller.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) / 2,
    );

    return centerLatLng;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? LocaleKeys.label_pick_a_location),
        actions: [
          if (!widget.readOnly)
            IconButton(
              onPressed: () async {
                // setState(() {
                //   print("Set marker");
                //   markers.assign(
                //     Marker(
                //       markerId: MarkerId('ahi'),
                //       position: markerLocation,
                //     ),
                //   );
                // });
                Get.back(
                  closeOverlays: true,
                  result: LocationWithAddress(
                    markerLocation,
                    address,
                  ),
                );
              },
              icon: const Icon(AppIcons.done),
            ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.terrain,
            markers: markers,
            rotateGesturesEnabled: false,
            initialCameraPosition: initialCameraPosition,
            zoomControlsEnabled: widget.needAddress ? false : true,
            onCameraIdle: () async {
              _markerKey.currentState?.drop();
              try {
                markerLocation = await getMarkerLocation();
                setState(() {
                  loadingAddress = true;
                  isDragging = false;
                });
                if (widget.needAddress) {
                  final geocode = await reverseGeocode(markerLocation);
                  if (mounted) {
                    setState(() {
                      address = geocode;
                    });
                  }
                }
              } catch (e) {
                alert(message: e.toString());
              } finally {
                if (mounted) {
                  setState(() {
                    loadingAddress = false;
                  });
                }
              }
            },
            onCameraMoveStarted: () {
              _markerKey.currentState?.lift();
              setState(() {
                loadingAddress = false;
                address = null;
                isDragging = true;
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          if (!isDragging && widget.needAddress)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                elevation: 10,
                borderRadius: AppDimens.borderRadiusSm,
                shadowColor: AppColors.shadowColor,
                color: AppColors.backgroundContrastColor(context),
                child: Builder(
                  builder: (context) {
                    if (loadingAddress) {
                      return const Center(
                        child: LoadingWidget(),
                      );
                    } else {
                      return Text(
                        address != null ? address! : latLngToString(markerLocation),
                        textAlign: TextAlign.center,
                      );
                    }
                  },
                ).paddingSymmetric(
                  horizontal: 16,
                  vertical: 15,
                ),
              ).paddingAll(10),
            ),
          if (!widget.readOnly)
            Positioned.fill(
              child: IgnorePointer(
                child: Center(
                  child: AnimatedMarker(
                    key: _markerKey,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
