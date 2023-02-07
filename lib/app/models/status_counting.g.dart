// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_counting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusCountingAdapter extends TypeAdapter<StatusCounting> {
  @override
  final int typeId = 18;

  @override
  StatusCounting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusCounting(
      count: fields[0] as int,
      status: fields[1] as ReportStatus,
    );
  }

  @override
  void write(BinaryWriter writer, StatusCounting obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusCountingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatusCounting _$$_StatusCountingFromJson(Map json) => _$_StatusCounting(
      count: json['count'] as int,
      status: ReportStatus.fromJson(
          Map<String, dynamic>.from(json['status'] as Map)),
    );

Map<String, dynamic> _$$_StatusCountingToJson(_$_StatusCounting instance) =>
    <String, dynamic>{
      'count': instance.count,
      'status': instance.status.toJson(),
    };
