// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nameable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Nameable _$NameableFromJson(Map<String, dynamic> json) {
  return _Nameable.fromJson(json);
}

/// @nodoc
mixin _$Nameable {
  @HiveField(0)
  String? get nameEn => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get nameKm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameableCopyWith<Nameable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameableCopyWith<$Res> {
  factory $NameableCopyWith(Nameable value, $Res Function(Nameable) then) =
      _$NameableCopyWithImpl<$Res>;
  $Res call({@HiveField(0) String? nameEn, @HiveField(1) String? nameKm});
}

/// @nodoc
class _$NameableCopyWithImpl<$Res> implements $NameableCopyWith<$Res> {
  _$NameableCopyWithImpl(this._value, this._then);

  final Nameable _value;
  // ignore: unused_field
  final $Res Function(Nameable) _then;

  @override
  $Res call({
    Object? nameEn = freezed,
    Object? nameKm = freezed,
  }) {
    return _then(_value.copyWith(
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NameableCopyWith<$Res> implements $NameableCopyWith<$Res> {
  factory _$$_NameableCopyWith(
          _$_Nameable value, $Res Function(_$_Nameable) then) =
      __$$_NameableCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) String? nameEn, @HiveField(1) String? nameKm});
}

/// @nodoc
class __$$_NameableCopyWithImpl<$Res> extends _$NameableCopyWithImpl<$Res>
    implements _$$_NameableCopyWith<$Res> {
  __$$_NameableCopyWithImpl(
      _$_Nameable _value, $Res Function(_$_Nameable) _then)
      : super(_value, (v) => _then(v as _$_Nameable));

  @override
  _$_Nameable get _value => super._value as _$_Nameable;

  @override
  $Res call({
    Object? nameEn = freezed,
    Object? nameKm = freezed,
  }) {
    return _then(_$_Nameable(
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String?,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nameable extends _Nameable {
  _$_Nameable({@HiveField(0) this.nameEn, @HiveField(1) this.nameKm})
      : super._();

  factory _$_Nameable.fromJson(Map<String, dynamic> json) =>
      _$$_NameableFromJson(json);

  @override
  @HiveField(0)
  final String? nameEn;
  @override
  @HiveField(1)
  final String? nameKm;

  @override
  String toString() {
    return 'Nameable(nameEn: $nameEn, nameKm: $nameKm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nameable &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.nameKm, nameKm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nameEn),
      const DeepCollectionEquality().hash(nameKm));

  @JsonKey(ignore: true)
  @override
  _$$_NameableCopyWith<_$_Nameable> get copyWith =>
      __$$_NameableCopyWithImpl<_$_Nameable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameableToJson(
      this,
    );
  }
}

abstract class _Nameable extends Nameable {
  factory _Nameable(
      {@HiveField(0) final String? nameEn,
      @HiveField(1) final String? nameKm}) = _$_Nameable;
  _Nameable._() : super._();

  factory _Nameable.fromJson(Map<String, dynamic> json) = _$_Nameable.fromJson;

  @override
  @HiveField(0)
  String? get nameEn;
  @override
  @HiveField(1)
  String? get nameKm;
  @override
  @JsonKey(ignore: true)
  _$$_NameableCopyWith<_$_Nameable> get copyWith =>
      throw _privateConstructorUsedError;
}
