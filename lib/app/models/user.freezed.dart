// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  @HiveField(1)
  String? get firstName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get lastName => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get fullName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get profilePhotoPath => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get profilePhotoUrl => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get address => throw _privateConstructorUsedError;
  @HiveField(8)
  Point? get location => throw _privateConstructorUsedError;
  @HiveField(9)
  Institution? get institution => throw _privateConstructorUsedError;
  @HiveField(10)
  String? get email => throw _privateConstructorUsedError;
  @HiveField(11)
  Role? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @JsonKey(name: 'name') @HiveField(1) String? firstName,
      @HiveField(2) String? lastName,
      @HiveField(3) String? fullName,
      @HiveField(4) String? profilePhotoPath,
      @HiveField(5) String? profilePhotoUrl,
      @HiveField(6) String? phoneNumber,
      @HiveField(7) String? address,
      @HiveField(8) Point? location,
      @HiveField(9) Institution? institution,
      @HiveField(10) String? email,
      @HiveField(11) Role? role});

  $PointCopyWith<$Res>? get location;
  $InstitutionCopyWith<$Res>? get institution;
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? profilePhotoPath = freezed,
    Object? profilePhotoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? institution = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoPath: profilePhotoPath == freezed
          ? _value.profilePhotoPath
          : profilePhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ));
  }

  @override
  $PointCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $InstitutionCopyWith<$Res>? get institution {
    if (_value.institution == null) {
      return null;
    }

    return $InstitutionCopyWith<$Res>(_value.institution!, (value) {
      return _then(_value.copyWith(institution: value));
    });
  }

  @override
  $RoleCopyWith<$Res>? get role {
    if (_value.role == null) {
      return null;
    }

    return $RoleCopyWith<$Res>(_value.role!, (value) {
      return _then(_value.copyWith(role: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @JsonKey(name: 'name') @HiveField(1) String? firstName,
      @HiveField(2) String? lastName,
      @HiveField(3) String? fullName,
      @HiveField(4) String? profilePhotoPath,
      @HiveField(5) String? profilePhotoUrl,
      @HiveField(6) String? phoneNumber,
      @HiveField(7) String? address,
      @HiveField(8) Point? location,
      @HiveField(9) Institution? institution,
      @HiveField(10) String? email,
      @HiveField(11) Role? role});

  @override
  $PointCopyWith<$Res>? get location;
  @override
  $InstitutionCopyWith<$Res>? get institution;
  @override
  $RoleCopyWith<$Res>? get role;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fullName = freezed,
    Object? profilePhotoPath = freezed,
    Object? profilePhotoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? address = freezed,
    Object? location = freezed,
    Object? institution = freezed,
    Object? email = freezed,
    Object? role = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoPath: profilePhotoPath == freezed
          ? _value.profilePhotoPath
          : profilePhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoUrl: profilePhotoUrl == freezed
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {@HiveField(0) required this.id,
      @JsonKey(name: 'name') @HiveField(1) this.firstName,
      @HiveField(2) this.lastName,
      @HiveField(3) this.fullName,
      @HiveField(4) this.profilePhotoPath,
      @HiveField(5) this.profilePhotoUrl,
      @HiveField(6) this.phoneNumber,
      @HiveField(7) this.address,
      @HiveField(8) this.location,
      @HiveField(9) this.institution,
      @HiveField(10) this.email,
      @HiveField(11) this.role})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'name')
  @HiveField(1)
  final String? firstName;
  @override
  @HiveField(2)
  final String? lastName;
  @override
  @HiveField(3)
  final String? fullName;
  @override
  @HiveField(4)
  final String? profilePhotoPath;
  @override
  @HiveField(5)
  final String? profilePhotoUrl;
  @override
  @HiveField(6)
  final String? phoneNumber;
  @override
  @HiveField(7)
  final String? address;
  @override
  @HiveField(8)
  final Point? location;
  @override
  @HiveField(9)
  final Institution? institution;
  @override
  @HiveField(10)
  final String? email;
  @override
  @HiveField(11)
  final Role? role;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, fullName: $fullName, profilePhotoPath: $profilePhotoPath, profilePhotoUrl: $profilePhotoUrl, phoneNumber: $phoneNumber, address: $address, location: $location, institution: $institution, email: $email, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality()
                .equals(other.profilePhotoPath, profilePhotoPath) &&
            const DeepCollectionEquality()
                .equals(other.profilePhotoUrl, profilePhotoUrl) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality()
                .equals(other.institution, institution) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.role, role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(profilePhotoPath),
      const DeepCollectionEquality().hash(profilePhotoUrl),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(institution),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(role));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {@HiveField(0) required final int id,
      @JsonKey(name: 'name') @HiveField(1) final String? firstName,
      @HiveField(2) final String? lastName,
      @HiveField(3) final String? fullName,
      @HiveField(4) final String? profilePhotoPath,
      @HiveField(5) final String? profilePhotoUrl,
      @HiveField(6) final String? phoneNumber,
      @HiveField(7) final String? address,
      @HiveField(8) final Point? location,
      @HiveField(9) final Institution? institution,
      @HiveField(10) final String? email,
      @HiveField(11) final Role? role}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'name')
  @HiveField(1)
  String? get firstName;
  @override
  @HiveField(2)
  String? get lastName;
  @override
  @HiveField(3)
  String? get fullName;
  @override
  @HiveField(4)
  String? get profilePhotoPath;
  @override
  @HiveField(5)
  String? get profilePhotoUrl;
  @override
  @HiveField(6)
  String? get phoneNumber;
  @override
  @HiveField(7)
  String? get address;
  @override
  @HiveField(8)
  Point? get location;
  @override
  @HiveField(9)
  Institution? get institution;
  @override
  @HiveField(10)
  String? get email;
  @override
  @HiveField(11)
  Role? get role;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
