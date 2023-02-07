// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_filter_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportFilterOptionAdapter extends TypeAdapter<ReportFilterOption> {
  @override
  final int typeId = 12;

  @override
  ReportFilterOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportFilterOption(
      minDate: fields[0] as DateTime,
      sectors: (fields[1] as List).cast<Sector>(),
      statuses: (fields[2] as List).cast<ReportStatus>(),
      provinces: (fields[3] as List).cast<Area>(),
    );
  }

  @override
  void write(BinaryWriter writer, ReportFilterOption obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.minDate)
      ..writeByte(1)
      ..write(obj.sectors)
      ..writeByte(2)
      ..write(obj.statuses)
      ..writeByte(3)
      ..write(obj.provinces);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportFilterOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportFilterOption _$$_ReportFilterOptionFromJson(Map json) =>
    _$_ReportFilterOption(
      minDate: DateTime.parse(json['min_date'] as String),
      sectors: (json['sectors'] as List<dynamic>)
          .map((e) => Sector.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      statuses: (json['statuses'] as List<dynamic>)
          .map(
              (e) => ReportStatus.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      provinces: (json['provinces'] as List<dynamic>)
          .map((e) => Area.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_ReportFilterOptionToJson(
        _$_ReportFilterOption instance) =>
    <String, dynamic>{
      'min_date': instance.minDate.toIso8601String(),
      'sectors': instance.sectors.map((e) => e.toJson()).toList(),
      'statuses': instance.statuses.map((e) => e.toJson()).toList(),
      'provinces': instance.provinces.map((e) => e.toJson()).toList(),
    };
