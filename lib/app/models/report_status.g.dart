// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportStatusAdapter extends TypeAdapter<ReportStatus> {
  @override
  final int typeId = 11;

  @override
  ReportStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportStatus(
      id: fields[0] as int,
      nameEn: fields[1] as String,
      nameKm: fields[2] as String?,
      color: fields[3] as String?,
      key: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportStatus obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameKm)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportStatus _$$_ReportStatusFromJson(Map json) => _$_ReportStatus(
      id: json['id'] as int,
      nameEn: json['name_en'] as String,
      nameKm: json['name_km'] as String?,
      color: json['color'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$_ReportStatusToJson(_$_ReportStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
      'color': instance.color,
      'key': instance.key,
    };
