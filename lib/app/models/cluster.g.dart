// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClusterAdapter extends TypeAdapter<Cluster> {
  @override
  final int typeId = 6;

  @override
  Cluster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cluster(
      cid: fields[0] as int?,
      count: fields[1] as int,
      bounding: (fields[2] as Map).cast<String, dynamic>(),
      location: fields[3] as Point,
    );
  }

  @override
  void write(BinaryWriter writer, Cluster obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cid)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.bounding)
      ..writeByte(3)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClusterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cluster _$$_ClusterFromJson(Map json) => _$_Cluster(
      cid: json['cid'] as int?,
      count: json['count'] as int,
      bounding: Map<String, dynamic>.from(json['bounding'] as Map),
      location:
          Point.fromJson(Map<String, dynamic>.from(json['location'] as Map)),
    );

Map<String, dynamic> _$$_ClusterToJson(_$_Cluster instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'count': instance.count,
      'bounding': instance.bounding,
      'location': instance.location.toJson(),
    };
