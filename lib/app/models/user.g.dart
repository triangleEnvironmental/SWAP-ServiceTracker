// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int,
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      fullName: fields[3] as String?,
      profilePhotoPath: fields[4] as String?,
      profilePhotoUrl: fields[5] as String?,
      phoneNumber: fields[6] as String?,
      address: fields[7] as String?,
      location: fields[8] as Point?,
      institution: fields[9] as Institution?,
      email: fields[10] as String?,
      role: fields[11] as Role?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.fullName)
      ..writeByte(4)
      ..write(obj.profilePhotoPath)
      ..writeByte(5)
      ..write(obj.profilePhotoUrl)
      ..writeByte(6)
      ..write(obj.phoneNumber)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.institution)
      ..writeByte(10)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map json) => _$_User(
      id: json['id'] as int,
      firstName: json['name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['full_name'] as String?,
      profilePhotoPath: json['profile_photo_path'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      location: json['location'] == null
          ? null
          : Point.fromJson(Map<String, dynamic>.from(json['location'] as Map)),
      institution: json['institution'] == null
          ? null
          : Institution.fromJson(
              Map<String, dynamic>.from(json['institution'] as Map)),
      email: json['email'] as String?,
      role: json['role'] == null
          ? null
          : Role.fromJson(Map<String, dynamic>.from(json['role'] as Map)),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'profile_photo_path': instance.profilePhotoPath,
      'profile_photo_url': instance.profilePhotoUrl,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'location': instance.location?.toJson(),
      'institution': instance.institution?.toJson(),
      'email': instance.email,
      'role': instance.role?.toJson(),
    };
