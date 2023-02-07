// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_notification.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterNotificationAdapter extends TypeAdapter<MasterNotification> {
  @override
  final int typeId = 19;

  @override
  MasterNotification read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MasterNotification(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String?,
      notificationableType: fields[3] as String?,
      notificationableId: fields[4] as int?,
      creator: fields[5] as User?,
      institution: fields[6] as Institution?,
    );
  }

  @override
  void write(BinaryWriter writer, MasterNotification obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.notificationableType)
      ..writeByte(4)
      ..write(obj.notificationableId)
      ..writeByte(5)
      ..write(obj.creator)
      ..writeByte(6)
      ..write(obj.institution);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterNotificationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MasterNotification _$$_MasterNotificationFromJson(Map json) =>
    _$_MasterNotification(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      notificationableType: json['notificationable_type'] as String?,
      notificationableId: json['notificationable_id'] as int?,
      creator: json['creator'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['creator'] as Map)),
      institution: json['institution'] == null
          ? null
          : Institution.fromJson(
              Map<String, dynamic>.from(json['institution'] as Map)),
    );

Map<String, dynamic> _$$_MasterNotificationToJson(
        _$_MasterNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'notificationable_type': instance.notificationableType,
      'notificationable_id': instance.notificationableId,
      'creator': instance.creator?.toJson(),
      'institution': instance.institution?.toJson(),
    };
