// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_marker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportMarkerAdapter extends TypeAdapter<ReportMarker> {
  @override
  final int typeId = 15;

  @override
  ReportMarker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportMarker(
      location: fields[0] as Point,
      cluster: fields[1] as Cluster?,
      report: fields[2] as Report?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportMarker obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.cluster)
      ..writeByte(2)
      ..write(obj.report);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportMarkerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportMarker _$$_ReportMarkerFromJson(Map json) => _$_ReportMarker(
      location:
          Point.fromJson(Map<String, dynamic>.from(json['location'] as Map)),
      cluster: json['cluster'] == null
          ? null
          : Cluster.fromJson(Map<String, dynamic>.from(json['cluster'] as Map)),
      report: json['report'] == null
          ? null
          : Report.fromJson(Map<String, dynamic>.from(json['report'] as Map)),
    );

Map<String, dynamic> _$$_ReportMarkerToJson(_$_ReportMarker instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'cluster': instance.cluster?.toJson(),
      'report': instance.report?.toJson(),
    };
