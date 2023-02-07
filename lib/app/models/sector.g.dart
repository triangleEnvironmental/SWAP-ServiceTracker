// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sector.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectorAdapter extends TypeAdapter<Sector> {
  @override
  final int typeId = 4;

  @override
  Sector read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sector(
      id: fields[0] as int,
      nameEn: fields[1] as String,
      nameKm: fields[2] as String?,
      iconPath: fields[3] as String?,
      iconUrl: fields[4] as String?,
      reportTypes: (fields[5] as List?)?.cast<ReportType>(),
    );
  }

  @override
  void write(BinaryWriter writer, Sector obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameKm)
      ..writeByte(3)
      ..write(obj.iconPath)
      ..writeByte(4)
      ..write(obj.iconUrl)
      ..writeByte(5)
      ..write(obj.reportTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SectorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sector _$$_SectorFromJson(Map json) => _$_Sector(
      id: json['id'] as int,
      nameEn: json['name_en'] as String,
      nameKm: json['name_km'] as String?,
      iconPath: json['icon_path'] as String?,
      iconUrl: json['icon_url'] as String?,
      reportTypes: (json['report_types'] as List<dynamic>?)
          ?.map((e) => ReportType.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_SectorToJson(_$_Sector instance) => <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
      'icon_path': instance.iconPath,
      'icon_url': instance.iconUrl,
      'report_types': instance.reportTypes?.map((e) => e.toJson()).toList(),
    };
