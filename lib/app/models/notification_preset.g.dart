// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationPresetAdapter extends TypeAdapter<NotificationPreset> {
  @override
  final int typeId = 22;

  @override
  NotificationPreset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationPreset(
      id: fields[0] as int,
      title: fields[1] as String?,
      description: fields[2] as String?,
      institutionId: fields[3] as int?,
      institution: fields[4] as Institution?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationPreset obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.institutionId)
      ..writeByte(4)
      ..write(obj.institution);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPresetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPreset _$$_NotificationPresetFromJson(Map json) =>
    _$_NotificationPreset(
      id: json['id'] as int,
      title: json['title'] as String?,
      description: json['description'] as String?,
      institutionId: json['institution_id'] as int?,
      institution: json['institution'] == null
          ? null
          : Institution.fromJson(
              Map<String, dynamic>.from(json['institution'] as Map)),
    );

Map<String, dynamic> _$$_NotificationPresetToJson(
        _$_NotificationPreset instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'institution_id': instance.institutionId,
      'institution': instance.institution?.toJson(),
    };
