// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'status_counting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusCounting _$StatusCountingFromJson(Map<String, dynamic> json) {
  return _StatusCounting.fromJson(json);
}

/// @nodoc
mixin _$StatusCounting {
  @HiveField(0)
  int get count => throw _privateConstructorUsedError;
  @HiveField(1)
  ReportStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCountingCopyWith<StatusCounting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCountingCopyWith<$Res> {
  factory $StatusCountingCopyWith(
          StatusCounting value, $Res Function(StatusCounting) then) =
      _$StatusCountingCopyWithImpl<$Res>;
  $Res call({@HiveField(0) int count, @HiveField(1) ReportStatus status});

  $ReportStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$StatusCountingCopyWithImpl<$Res>
    implements $StatusCountingCopyWith<$Res> {
  _$StatusCountingCopyWithImpl(this._value, this._then);

  final StatusCounting _value;
  // ignore: unused_field
  final $Res Function(StatusCounting) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ));
  }

  @override
  $ReportStatusCopyWith<$Res> get status {
    return $ReportStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$$_StatusCountingCopyWith<$Res>
    implements $StatusCountingCopyWith<$Res> {
  factory _$$_StatusCountingCopyWith(
          _$_StatusCounting value, $Res Function(_$_StatusCounting) then) =
      __$$_StatusCountingCopyWithImpl<$Res>;
  @override
  $Res call({@HiveField(0) int count, @HiveField(1) ReportStatus status});

  @override
  $ReportStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$_StatusCountingCopyWithImpl<$Res>
    extends _$StatusCountingCopyWithImpl<$Res>
    implements _$$_StatusCountingCopyWith<$Res> {
  __$$_StatusCountingCopyWithImpl(
      _$_StatusCounting _value, $Res Function(_$_StatusCounting) _then)
      : super(_value, (v) => _then(v as _$_StatusCounting));

  @override
  _$_StatusCounting get _value => super._value as _$_StatusCounting;

  @override
  $Res call({
    Object? count = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_StatusCounting(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReportStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusCounting extends _StatusCounting {
  _$_StatusCounting(
      {@HiveField(0) required this.count, @HiveField(1) required this.status})
      : super._();

  factory _$_StatusCounting.fromJson(Map<String, dynamic> json) =>
      _$$_StatusCountingFromJson(json);

  @override
  @HiveField(0)
  final int count;
  @override
  @HiveField(1)
  final ReportStatus status;

  @override
  String toString() {
    return 'StatusCounting(count: $count, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusCounting &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_StatusCountingCopyWith<_$_StatusCounting> get copyWith =>
      __$$_StatusCountingCopyWithImpl<_$_StatusCounting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusCountingToJson(
      this,
    );
  }
}

abstract class _StatusCounting extends StatusCounting {
  factory _StatusCounting(
      {@HiveField(0) required final int count,
      @HiveField(1) required final ReportStatus status}) = _$_StatusCounting;
  _StatusCounting._() : super._();

  factory _StatusCounting.fromJson(Map<String, dynamic> json) =
      _$_StatusCounting.fromJson;

  @override
  @HiveField(0)
  int get count;
  @override
  @HiveField(1)
  ReportStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_StatusCountingCopyWith<_$_StatusCounting> get copyWith =>
      throw _privateConstructorUsedError;
}
