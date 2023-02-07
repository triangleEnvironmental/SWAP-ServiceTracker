import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:moderator_app/app/models/point.dart';
import 'package:moderator_app/app/utils/helpers.dart';

class LocationWithAddress {
  String? address;
  final LatLng location;

  LocationWithAddress(
    this.location,
    this.address,
  );

  factory LocationWithAddress.fromLatLng(LatLng latLng) {
    return LocationWithAddress(latLng, null);
  }

  factory LocationWithAddress.fromLocationData(LocationData latLng) {
    return LocationWithAddress(LatLng(latLng.latitude!, latLng.longitude!), null);
  }

  factory LocationWithAddress.fromPoint(Point latLng) {
    return LocationWithAddress(LatLng(latLng.latitude, latLng.longitude), null);
  }

  Widget text({
    TextStyle? style,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return FutureBuilder<String>(
      future: getAddress(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          return Text(
            snapshot.data!,
            textAlign: textAlign,
            overflow: overflow,
            style: style,
          );
        } else {
          return Text(
            latLngToString(location),
            textAlign: textAlign,
            overflow: overflow,
            style: style,
          );
        }
      },
    );
  }

  double get latitude => location.latitude;

  double get longitude => location.longitude;

  Future<String> getAddress() async {
    address ??= await reverseGeocode(location);
    return address!;
  }
}
