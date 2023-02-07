import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:moderator_app/app/globals/index.dart';
import 'package:permission_handler/permission_handler.dart' as permission_handler;
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/locales/index.dart';

class LocationService extends GetxService {
  Location location = Location();
  ValueNotifier<LocationWithAddress?> lastKnownLocation = ValueNotifier(null);
  Rx<bool> requestingLocation = false.obs;

  LocationWithAddress? get lastLatLng {
    return lastKnownLocation.value;
  }

  requestPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw 'GPS disabled';
        }
      }
    } catch (e) {
      print(e);
      throw 'GPS disabled';
    }

    try {
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw 'Permission denied';
        }
      }
    } catch (e) {
      print(e);
      throw 'Permission denied';
    }
  }

  Future<bool> requestGps() async {
    return await location.requestService();
  }

  Future<LocationService> init() async {
    try {
      await requestPermission();
    }  catch (e) {
      print(e);
    }
    return this;
  }

  Future<LocationWithAddress?> getCurrentLocation({
    bool fromLastKnownLocation = false,
  }) async {
    if (fromLastKnownLocation && lastKnownLocation.value != null) {
      return lastKnownLocation.value;
    }
    try {
      await requestPermission();
      return LocationWithAddress.fromLocationData(await location.getLocation());
    } catch (e) {
      print(e);
    }
    return null;
  }

  goToLocationSetting() async {
    await permission_handler.openAppSettings();
  }

  Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    LocationData location = LocationData.fromMap({
      'latitude': latitude,
      'longitude': longitude,
    });
    if (location.latitude == null || location.longitude == null) {
      return null;
    }
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(location.latitude!, location.longitude!);

    var place = placemarks.first;
    return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  }

  Future updateUserLocation({bool checkTimeout = true}) async {
    final completer = Completer<LocationWithAddress?>();
    final timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {
        if (checkTimeout && !completer.isCompleted) {
          alert(message: LocaleKeys.error_process_taking_too_long);
          completer.complete(null);
        }
      },
    );

    getCurrentLocation().then((value) {
      if (!completer.isCompleted) {
        if (value != null) {
          lastKnownLocation.value = value;
        }
        if (checkTimeout && timer.isActive) {
          timer.cancel();
        }
        completer.complete(value);
      }
    });

    await completer.future;
  }
}