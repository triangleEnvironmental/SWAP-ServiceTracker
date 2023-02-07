// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaAdapter extends TypeAdapter<Media> {
  @override
  final int typeId = 8;

  @override
  Media read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Media(
      id: fields[0] as int,
      path: fields[1] as String?,
      mediaUrl: fields[2] as String,
      mediableType: fields[3] as String?,
      mediableId: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Media obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.mediaUrl)
      ..writeByte(3)
      ..write(obj.mediableType)
      ..writeByte(4)
      ..write(obj.mediableId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Media _$$_MediaFromJson(Map json) => _$_Media(
      id: json['id'] as int,
      path: json['path'] as String?,
      mediaUrl: json['media_url'] as String,
      mediableType: json['mediable_type'] as String?,
      mediableId: json['mediable_id'] as int?,
    );

Map<String, dynamic> _$$_MediaToJson(_$_Media instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'media_url': instance.mediaUrl,
      'mediable_type': instance.mediableType,
      'mediable_id': instance.mediableId,
    };
