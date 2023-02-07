import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/models/point.dart';

part 'cluster.freezed.dart';
part 'cluster.g.dart';

@HiveType(typeId: 6)
@Freezed(makeCollectionsUnmodifiable: true)
class Cluster with _$Cluster {
  const Cluster._();

  factory Cluster({
    @HiveField(0) int? cid,
    @HiveField(1) required int count,
    @HiveField(2) required Map<String, dynamic> bounding,
    @HiveField(3) required Point location,
  }) = _Cluster;

  LatLngBounds get bound {
    double padding = 0.0002;
    if (bounding.containsKey('type') && bounding['type'] == 'Polygon') {
      double? minLat;
      double? minLng;
      double? maxLat;
      double? maxLng;
      for (var lineString in bounding['coordinates']) {
        for (var point in lineString) {
          if (minLat == null || minLat > point[1]) {
            minLat = point[1];
          }
          if (minLng == null || minLng > point[0]) {
            minLng = point[0];
          }
          if (maxLat == null || maxLat < point[1]) {
            maxLat = point[1];
          }
          if (maxLng == null || maxLng < point[0]) {
            maxLng = point[0];
          }
        }
      }
      return LatLngBounds(
        southwest: LatLng(
          minLat!,
          minLng!,
        ),
        northeast: LatLng(
          maxLat!,
          maxLng!,
        ),
      );
    }
    return LatLngBounds(
      southwest: LatLng(
        location.latitude - padding,
        location.longitude - padding,
      ),
      northeast: LatLng(
        location.latitude + padding,
        location.longitude + padding,
      ),
    );
  }

  factory Cluster.fromJson(Map<String, dynamic> json) => _$ClusterFromJson(json);
}