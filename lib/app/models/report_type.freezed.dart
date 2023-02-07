// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportType _$ReportTypeFromJson(Map<String, dynamic> json) {
  return _ReportType.fromJson(json);
}

/// @nodoc
mixin _$ReportType {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get sectorId => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get isPrivate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportTypeCopyWith<ReportType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTypeCopyWith<$Res> {
  factory $ReportTypeCopyWith(
          ReportType value, $Res Function(ReportType) then) =
      _$ReportTypeCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) int? sectorId,
      @HiveField(4) bool? isPrivate});
}

/// @nodoc
class _$ReportTypeCopyWithImpl<$Res> implements $ReportTypeCopyWith<$Res> {
  _$ReportTypeCopyWithImpl(this._value, this._then);

  final ReportType _value;
  // ignore: unused_field
  final $Res Function(ReportType) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? sectorId = freezed,
    Object? isPrivate = freezed,
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
      sectorId: sectorId == freezed
          ? _value.sectorId
          : sectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: isPrivate == freezed
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportTypeCopyWith<$Res>
    implements $ReportTypeCopyWith<$Res> {
  factory _$$_ReportTypeCopyWith(
          _$_ReportType value, $Res Function(_$_ReportType) then) =
      __$$_ReportTypeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) int? sectorId,
      @HiveField(4) bool? isPrivate});
}

/// @nodoc
class __$$_ReportTypeCopyWithImpl<$Res> extends _$ReportTypeCopyWithImpl<$Res>
    implements _$$_ReportTypeCopyWith<$Res> {
  __$$_ReportTypeCopyWithImpl(
      _$_ReportType _value, $Res Function(_$_ReportType) _then)
      : super(_value, (v) => _then(v as _$_ReportType));

  @override
  _$_ReportType get _value => super._value as _$_ReportType;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? sectorId = freezed,
    Object? isPrivate = freezed,
  }) {
    return _then(_$_ReportType(
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
      sectorId: sectorId == freezed
          ? _value.sectorId
          : sectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrivate: isPrivate == freezed
          ? _value.isPrivate
          : isPrivate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportType extends _ReportType {
  _$_ReportType(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm,
      @HiveField(3) this.sectorId,
      @HiveField(4) this.isPrivate})
      : super._();

  factory _$_ReportType.fromJson(Map<String, dynamic> json) =>
      _$$_ReportTypeFromJson(json);

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
  final int? sectorId;
  @override
  @HiveField(4)
  final bool? isPrivate;

  @override
  String toString() {
    return 'ReportType(id: $id, nameEn: $nameEn, nameKm: $nameKm, sectorId: $sectorId, isPrivate: $isPrivate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportType &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.nameKm, nameKm) &&
            const DeepCollectionEquality().equals(other.sectorId, sectorId) &&
            const DeepCollectionEquality().equals(other.isPrivate, isPrivate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nameEn),
      const DeepCollectionEquality().hash(nameKm),
      const DeepCollectionEquality().hash(sectorId),
      const DeepCollectionEquality().hash(isPrivate));

  @JsonKey(ignore: true)
  @override
  _$$_ReportTypeCopyWith<_$_ReportType> get copyWith =>
      __$$_ReportTypeCopyWithImpl<_$_ReportType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportTypeToJson(
      this,
    );
  }
}

abstract class _ReportType extends ReportType {
  factory _ReportType(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm,
      @HiveField(3) final int? sectorId,
      @HiveField(4) final bool? isPrivate}) = _$_ReportType;
  _ReportType._() : super._();

  factory _ReportType.fromJson(Map<String, dynamic> json) =
      _$_ReportType.fromJson;

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
  int? get sectorId;
  @override
  @HiveField(4)
  bool? get isPrivate;
  @override
  @JsonKey(ignore: true)
  _$$_ReportTypeCopyWith<_$_ReportType> get copyWith =>
      throw _privateConstructorUsedError;
}
