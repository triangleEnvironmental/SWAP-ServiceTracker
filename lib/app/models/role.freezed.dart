// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'role.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Role _$RoleFromJson(Map<String, dynamic> json) {
  return _Role.fromJson(json);
}

/// @nodoc
mixin _$Role {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;
  @HiveField(3)
  bool? get isUnderInstitution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleCopyWith<Role> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleCopyWith<$Res> {
  factory $RoleCopyWith(Role value, $Res Function(Role) then) =
      _$RoleCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) bool? isUnderInstitution});
}

/// @nodoc
class _$RoleCopyWithImpl<$Res> implements $RoleCopyWith<$Res> {
  _$RoleCopyWithImpl(this._value, this._then);

  final Role _value;
  // ignore: unused_field
  final $Res Function(Role) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? isUnderInstitution = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
      isUnderInstitution: isUnderInstitution == freezed
          ? _value.isUnderInstitution
          : isUnderInstitution // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_RoleCopyWith<$Res> implements $RoleCopyWith<$Res> {
  factory _$$_RoleCopyWith(_$_Role value, $Res Function(_$_Role) then) =
      __$$_RoleCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) bool? isUnderInstitution});
}

/// @nodoc
class __$$_RoleCopyWithImpl<$Res> extends _$RoleCopyWithImpl<$Res>
    implements _$$_RoleCopyWith<$Res> {
  __$$_RoleCopyWithImpl(_$_Role _value, $Res Function(_$_Role) _then)
      : super(_value, (v) => _then(v as _$_Role));

  @override
  _$_Role get _value => super._value as _$_Role;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? isUnderInstitution = freezed,
  }) {
    return _then(_$_Role(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
      isUnderInstitution: isUnderInstitution == freezed
          ? _value.isUnderInstitution
          : isUnderInstitution // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Role extends _Role {
  _$_Role(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm,
      @HiveField(3) this.isUnderInstitution})
      : super._();

  factory _$_Role.fromJson(Map<String, dynamic> json) => _$$_RoleFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String nameEn;
  @override
  @HiveField(2)
  final String? nameKm;
  @override
  @HiveField(3)
  final bool? isUnderInstitution;

  @override
  String toString() {
    return 'Role(id: $id, nameEn: $nameEn, nameKm: $nameKm, isUnderInstitution: $isUnderInstitution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Role &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.nameKm, nameKm) &&
            const DeepCollectionEquality()
                .equals(other.isUnderInstitution, isUnderInstitution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nameEn),
      const DeepCollectionEquality().hash(nameKm),
      const DeepCollectionEquality().hash(isUnderInstitution));

  @JsonKey(ignore: true)
  @override
  _$$_RoleCopyWith<_$_Role> get copyWith =>
      __$$_RoleCopyWithImpl<_$_Role>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoleToJson(
      this,
    );
  }
}

abstract class _Role extends Role {
  factory _Role(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm,
      @HiveField(3) final bool? isUnderInstitution}) = _$_Role;
  _Role._() : super._();

  factory _Role.fromJson(Map<String, dynamic> json) = _$_Role.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get nameEn;
  @override
  @HiveField(2)
  String? get nameKm;
  @override
  @HiveField(3)
  bool? get isUnderInstitution;
  @override
  @JsonKey(ignore: true)
  _$$_RoleCopyWith<_$_Role> get copyWith => throw _privateConstructorUsedError;
}
