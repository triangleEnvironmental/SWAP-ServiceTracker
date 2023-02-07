// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'html_page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HtmlPageAdapter extends TypeAdapter<HtmlPage> {
  @override
  final int typeId = 20;

  @override
  HtmlPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HtmlPage(
      id: fields[0] as int,
      key: fields[1] as String,
      contentEn: fields[2] as String,
      contentKm: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HtmlPage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.key)
      ..writeByte(2)
      ..write(obj.contentEn)
      ..writeByte(3)
      ..write(obj.contentKm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HtmlPage _$$_HtmlPageFromJson(Map json) => _$_HtmlPage(
      id: json['id'] as int,
      key: json['key'] as String,
      contentEn: json['content_en'] as String,
      contentKm: json['content_km'] as String?,
    );

Map<String, dynamic> _$$_HtmlPageToJson(_$_HtmlPage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'content_en': instance.contentEn,
      'content_km': instance.contentKm,
    };
