import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'report_marker.freezed.dart';

part 'report_marker.g.dart';

@HiveType(typeId: 15)
@Freezed(makeCollectionsUnmodifiable: true)
class ReportMarker with _$ReportMarker {
  const ReportMarker._();

  factory ReportMarker({
    @HiveField(0) required Point location,
    @HiveField(1) Cluster? cluster,
    @HiveField(2) Report? report,
  }) = _ReportMarker;

  factory ReportMarker.fromJson(Map<String, dynamic> json) => _$ReportMarkerFromJson(json);
}