// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institution.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InstitutionAdapter extends TypeAdapter<Institution> {
  @override
  final int typeId = 3;

  @override
  Institution read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Institution(
      id: fields[0] as int,
      nameEn: fields[1] as String,
      nameKm: fields[2] as String?,
      logoPath: fields[3] as String?,
      logoUrl: fields[4] as String?,
      sectors: (fields[5] as List?)?.cast<Sector>(),
      isMunicipality: fields[6] as bool?,
      isServiceProvider: fields[7] as bool?,
      users: (fields[8] as List?)?.cast<User>(),
    );
  }

  @override
  void write(BinaryWriter writer, Institution obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameEn)
      ..writeByte(2)
      ..write(obj.nameKm)
      ..writeByte(3)
      ..write(obj.logoPath)
      ..writeByte(4)
      ..write(obj.logoUrl)
      ..writeByte(5)
      ..write(obj.sectors)
      ..writeByte(6)
      ..write(obj.isMunicipality)
      ..writeByte(7)
      ..write(obj.isServiceProvider)
      ..writeByte(8)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InstitutionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Institution _$$_InstitutionFromJson(Map json) => _$_Institution(
      id: json['id'] as int,
      nameEn: json['name_en'] as String,
      nameKm: json['name_km'] as String?,
      logoPath: json['logo_path'] as String?,
      logoUrl: json['logo_url'] as String?,
      sectors: (json['sectors'] as List<dynamic>?)
          ?.map((e) => Sector.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      isMunicipality: json['is_municipality'] as bool?,
      isServiceProvider: json['is_service_provider'] as bool?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_InstitutionToJson(_$_Institution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
      'logo_path': instance.logoPath,
      'logo_url': instance.logoUrl,
      'sectors': instance.sectors?.map((e) => e.toJson()).toList(),
      'is_municipality': instance.isMunicipality,
      'is_service_provider': instance.isServiceProvider,
      'users': instance.users?.map((e) => e.toJson()).toList(),
    };
