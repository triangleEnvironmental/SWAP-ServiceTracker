// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssignmentOptionAdapter extends TypeAdapter<AssignmentOption> {
  @override
  final int typeId = 21;

  @override
  AssignmentOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssignmentOption(
      adminUsers: (fields[0] as List).cast<User>(),
      institutions: (fields[1] as List).cast<Institution>(),
    );
  }

  @override
  void write(BinaryWriter writer, AssignmentOption obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.adminUsers)
      ..writeByte(1)
      ..write(obj.institutions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssignmentOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AssignmentOption _$$_AssignmentOptionFromJson(Map json) =>
    _$_AssignmentOption(
      adminUsers: (json['admin_users'] as List<dynamic>)
          .map((e) => User.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      institutions: (json['institutions'] as List<dynamic>)
          .map((e) => Institution.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_AssignmentOptionToJson(_$_AssignmentOption instance) =>
    <String, dynamic>{
      'admin_users': instance.adminUsers.map((e) => e.toJson()).toList(),
      'institutions': instance.institutions.map((e) => e.toJson()).toList(),
    };
