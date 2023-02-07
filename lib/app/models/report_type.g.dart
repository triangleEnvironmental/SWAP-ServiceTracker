// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportTypeAdapter extends TypeAdapter<ReportType> {
  @override
  final int typeId = 5;

  @override
  ReportType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportType(
      id: fields[0] as int,
      nameEn: fields[1] as String,
      nameKm: fields[2] as String?,
      sectorId: fields[3] as int?,
      isPrivate: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportType obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameKm)
      ..writeByte(3)
      ..write(obj.sectorId)
      ..writeByte(4)
      ..write(obj.isPrivate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportType _$$_ReportTypeFromJson(Map json) => _$_ReportType(
      id: json['id'] as int,
      nameEn: json['name_en'] as String,
      nameKm: json['name_km'] as String?,
      sectorId: json['sector_id'] as int?,
      isPrivate: json['is_private'] as bool?,
    );

Map<String, dynamic> _$$_ReportTypeToJson(_$_ReportType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
      'sector_id': instance.sectorId,
      'is_private': instance.isPrivate,
    };
