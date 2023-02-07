// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModerationHistoryAdapter extends TypeAdapter<ModerationHistory> {
  @override
  final int typeId = 9;

  @override
  ModerationHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModerationHistory(
      id: fields[0] as int?,
      fromStatusId: fields[1] as int?,
      toStatusId: fields[2] as int?,
      moderatedByUserId: fields[3] as int?,
      masterNotificationId: fields[4] as int?,
      createdAt: fields[5] as DateTime?,
      fromStatus: fields[6] as ReportStatus?,
      toStatus: fields[7] as ReportStatus?,
      moderator: fields[8] as User?,
      masterNotification: fields[9] as MasterNotification?,
      report: fields[10] as Report?,
    );
  }

  @override
  void write(BinaryWriter writer, ModerationHistory obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fromStatusId)
      ..writeByte(2)
      ..write(obj.toStatusId)
      ..writeByte(3)
      ..write(obj.moderatedByUserId)
      ..writeByte(4)
      ..write(obj.masterNotificationId)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.fromStatus)
      ..writeByte(7)
      ..write(obj.toStatus)
      ..writeByte(8)
      ..write(obj.moderator)
      ..writeByte(9)
      ..write(obj.masterNotification)
      ..writeByte(10)
      ..write(obj.report);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModerationHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModerationHistory _$$_ModerationHistoryFromJson(Map json) =>
    _$_ModerationHistory(
      id: json['id'] as int?,
      fromStatusId: json['from_status_id'] as int?,
      toStatusId: json['to_status_id'] as int?,
      moderatedByUserId: json['moderated_by_user_id'] as int?,
      masterNotificationId: json['master_notification_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      fromStatus: json['from_status'] == null
          ? null
          : ReportStatus.fromJson(
              Map<String, dynamic>.from(json['from_status'] as Map)),
      toStatus: json['to_status'] == null
          ? null
          : ReportStatus.fromJson(
              Map<String, dynamic>.from(json['to_status'] as Map)),
      moderator: json['moderator'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['moderator'] as Map)),
      masterNotification: json['master_notification'] == null
          ? null
          : MasterNotification.fromJson(
              Map<String, dynamic>.from(json['master_notification'] as Map)),
      report: json['report'] == null
          ? null
          : Report.fromJson(Map<String, dynamic>.from(json['report'] as Map)),
    );

Map<String, dynamic> _$$_ModerationHistoryToJson(
        _$_ModerationHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_status_id': instance.fromStatusId,
      'to_status_id': instance.toStatusId,
      'moderated_by_user_id': instance.moderatedByUserId,
      'master_notification_id': instance.masterNotificationId,
      'created_at': instance.createdAt?.toIso8601String(),
      'from_status': instance.fromStatus?.toJson(),
      'to_status': instance.toStatus?.toJson(),
      'moderator': instance.moderator?.toJson(),
      'master_notification': instance.masterNotification?.toJson(),
      'report': instance.report?.toJson(),
    };
