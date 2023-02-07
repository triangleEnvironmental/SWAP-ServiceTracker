// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final int typeId = 7;

  @override
  Comment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Comment(
      id: fields[0] as int,
      text: fields[1] as String?,
      reportId: fields[2] as int?,
      commentedByUserId: fields[3] as int?,
      isPublic: fields[4] as bool?,
      createdAt: fields[5] as DateTime?,
      medias: (fields[6] as List?)?.cast<Media>(),
      commenter: fields[7] as User?,
      canDelete: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.reportId)
      ..writeByte(3)
      ..write(obj.commentedByUserId)
      ..writeByte(4)
      ..write(obj.isPublic)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.medias)
      ..writeByte(7)
      ..write(obj.commenter)
      ..writeByte(8)
      ..write(obj.canDelete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map json) => _$_Comment(
      id: json['id'] as int,
      text: json['text'] as String?,
      reportId: json['report_id'] as int?,
      commentedByUserId: json['commented_by_user_id'] as int?,
      isPublic: json['is_public'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      medias: (json['medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      commenter: json['commenter'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['commenter'] as Map)),
      canDelete: json['can_delete'] as bool?,
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'report_id': instance.reportId,
      'commented_by_user_id': instance.commentedByUserId,
      'is_public': instance.isPublic,
      'created_at': instance.createdAt?.toIso8601String(),
      'medias': instance.medias?.map((e) => e.toJson()).toList(),
      'commenter': instance.commenter?.toJson(),
      'can_delete': instance.canDelete,
    };
