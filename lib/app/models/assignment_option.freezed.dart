// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assignment_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssignmentOption _$AssignmentOptionFromJson(Map<String, dynamic> json) {
  return _AssignmentOption.fromJson(json);
}

/// @nodoc
mixin _$AssignmentOption {
  @HiveField(0)
  List<User> get adminUsers => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Institution> get institutions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignmentOptionCopyWith<AssignmentOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentOptionCopyWith<$Res> {
  factory $AssignmentOptionCopyWith(
          AssignmentOption value, $Res Function(AssignmentOption) then) =
      _$AssignmentOptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<User> adminUsers,
      @HiveField(1) List<Institution> institutions});
}

/// @nodoc
class _$AssignmentOptionCopyWithImpl<$Res>
    implements $AssignmentOptionCopyWith<$Res> {
  _$AssignmentOptionCopyWithImpl(this._value, this._then);

  final AssignmentOption _value;
  // ignore: unused_field
  final $Res Function(AssignmentOption) _then;

  @override
  $Res call({
    Object? adminUsers = freezed,
    Object? institutions = freezed,
  }) {
    return _then(_value.copyWith(
      adminUsers: adminUsers == freezed
          ? _value.adminUsers
          : adminUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      institutions: institutions == freezed
          ? _value.institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
    ));
  }
}

/// @nodoc
abstract class _$$_AssignmentOptionCopyWith<$Res>
    implements $AssignmentOptionCopyWith<$Res> {
  factory _$$_AssignmentOptionCopyWith(
          _$_AssignmentOption value, $Res Function(_$_AssignmentOption) then) =
      __$$_AssignmentOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<User> adminUsers,
      @HiveField(1) List<Institution> institutions});
}

/// @nodoc
class __$$_AssignmentOptionCopyWithImpl<$Res>
    extends _$AssignmentOptionCopyWithImpl<$Res>
    implements _$$_AssignmentOptionCopyWith<$Res> {
  __$$_AssignmentOptionCopyWithImpl(
      _$_AssignmentOption _value, $Res Function(_$_AssignmentOption) _then)
      : super(_value, (v) => _then(v as _$_AssignmentOption));

  @override
  _$_AssignmentOption get _value => super._value as _$_AssignmentOption;

  @override
  $Res call({
    Object? adminUsers = freezed,
    Object? institutions = freezed,
  }) {
    return _then(_$_AssignmentOption(
      adminUsers: adminUsers == freezed
          ? _value._adminUsers
          : adminUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      institutions: institutions == freezed
          ? _value._institutions
          : institutions // ignore: cast_nullable_to_non_nullable
              as List<Institution>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignmentOption extends _AssignmentOption {
  _$_AssignmentOption(
      {@HiveField(0) required final List<User> adminUsers,
      @HiveField(1) required final List<Institution> institutions})
      : _adminUsers = adminUsers,
        _institutions = institutions,
        super._();

  factory _$_AssignmentOption.fromJson(Map<String, dynamic> json) =>
      _$$_AssignmentOptionFromJson(json);

  final List<User> _adminUsers;
  @override
  @HiveField(0)
  List<User> get adminUsers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminUsers);
  }

  final List<Institution> _institutions;
  @override
  @HiveField(1)
  List<Institution> get institutions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_institutions);
  }

  @override
  String toString() {
    return 'AssignmentOption(adminUsers: $adminUsers, institutions: $institutions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignmentOption &&
            const DeepCollectionEquality()
                .equals(other._adminUsers, _adminUsers) &&
            const DeepCollectionEquality()
                .equals(other._institutions, _institutions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_adminUsers),
      const DeepCollectionEquality().hash(_institutions));

  @JsonKey(ignore: true)
  @override
  _$$_AssignmentOptionCopyWith<_$_AssignmentOption> get copyWith =>
      __$$_AssignmentOptionCopyWithImpl<_$_AssignmentOption>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignmentOptionToJson(
      this,
    );
  }
}

abstract class _AssignmentOption extends AssignmentOption {
  factory _AssignmentOption(
          {@HiveField(0) required final List<User> adminUsers,
          @HiveField(1) required final List<Institution> institutions}) =
      _$_AssignmentOption;
  _AssignmentOption._() : super._();

  factory _AssignmentOption.fromJson(Map<String, dynamic> json) =
      _$_AssignmentOption.fromJson;

  @override
  @HiveField(0)
  List<User> get adminUsers;
  @override
  @HiveField(1)
  List<Institution> get institutions;
  @override
  @JsonKey(ignore: true)
  _$$_AssignmentOptionCopyWith<_$_AssignmentOption> get copyWith =>
      throw _privateConstructorUsedError;
}
