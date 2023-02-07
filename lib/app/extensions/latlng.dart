import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:moderator_app/app/utils/index.dart';

extension AppLatLng on LatLng {
  Widget text({
    TextStyle? style,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return FutureBuilder<String>(
      future: reverseGeocode(this),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            textAlign: textAlign,
            overflow: overflow,
            style: style,
          );
        } else {
          return Text(
            latLngToString(this),
            textAlign: textAlign,
            overflow: overflow,
            style: style,
          );
        }
      },
    );
  }

  LocationData get locationData {
    return LocationData.fromMap({
      'latitude': latitude,
      'longitude': longitude,
    });
  }
}
