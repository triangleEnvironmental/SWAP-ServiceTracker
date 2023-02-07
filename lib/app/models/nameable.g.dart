// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nameable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NameableAdapter extends TypeAdapter<Nameable> {
  @override
  final int typeId = 10;

  @override
  Nameable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nameable(
      nameEn: fields[0] as String?,
      nameKm: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Nameable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.nameEn)
      ..writeByte(1)
      ..write(obj.nameKm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Nameable _$$_NameableFromJson(Map json) => _$_Nameable(
      nameEn: json['name_en'] as String?,
      nameKm: json['name_km'] as String?,
    );

Map<String, dynamic> _$$_NameableToJson(_$_Nameable instance) =>
    <String, dynamic>{
      'name_en': instance.nameEn,
      'name_km': instance.nameKm,
    };
