import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';

part 'point.freezed.dart';

part 'point.g.dart';

@HiveType(typeId: 2)
@Freezed(makeCollectionsUnmodifiable: true)
class Point with _$Point {
  const Point._();

  factory Point({
    @HiveField(0) required String type,
    @HiveField(1) required List<double> coordinates,
  }) = _Point;

  double get latitude => coordinates[1];

  double get longitude => coordinates[0];

  LatLng get latLng {
    return LatLng(latitude, longitude);
  }

  LocationData get locationData {
    return LocationData.fromMap({
      'latitude': latitude,
      'longitude': longitude,
    });
  }

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
