// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomePageData _$HomePageDataFromJson(Map<String, dynamic> json) {
  return _HomePageData.fromJson(json);
}

/// @nodoc
mixin _$HomePageData {
  @HiveField(0)
  List<StatusCounting> get statusCountings =>
      throw _privateConstructorUsedError;
  @HiveField(1)
  List<Report> get recentReports => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomePageDataCopyWith<HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageDataCopyWith<$Res> {
  factory $HomePageDataCopyWith(
          HomePageData value, $Res Function(HomePageData) then) =
      _$HomePageDataCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) List<StatusCounting> statusCountings,
      @HiveField(1) List<Report> recentReports});
}

/// @nodoc
class _$HomePageDataCopyWithImpl<$Res> implements $HomePageDataCopyWith<$Res> {
  _$HomePageDataCopyWithImpl(this._value, this._then);

  final HomePageData _value;
  // ignore: unused_field
  final $Res Function(HomePageData) _then;

  @override
  $Res call({
    Object? statusCountings = freezed,
    Object? recentReports = freezed,
  }) {
    return _then(_value.copyWith(
      statusCountings: statusCountings == freezed
          ? _value.statusCountings
          : statusCountings // ignore: cast_nullable_to_non_nullable
              as List<StatusCounting>,
      recentReports: recentReports == freezed
          ? _value.recentReports
          : recentReports // ignore: cast_nullable_to_non_nullable
              as List<Report>,
    ));
  }
}

/// @nodoc
abstract class _$$_HomePageDataCopyWith<$Res>
    implements $HomePageDataCopyWith<$Res> {
  factory _$$_HomePageDataCopyWith(
          _$_HomePageData value, $Res Function(_$_HomePageData) then) =
      __$$_HomePageDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) List<StatusCounting> statusCountings,
      @HiveField(1) List<Report> recentReports});
}

/// @nodoc
class __$$_HomePageDataCopyWithImpl<$Res>
    extends _$HomePageDataCopyWithImpl<$Res>
    implements _$$_HomePageDataCopyWith<$Res> {
  __$$_HomePageDataCopyWithImpl(
      _$_HomePageData _value, $Res Function(_$_HomePageData) _then)
      : super(_value, (v) => _then(v as _$_HomePageData));

  @override
  _$_HomePageData get _value => super._value as _$_HomePageData;

  @override
  $Res call({
    Object? statusCountings = freezed,
    Object? recentReports = freezed,
  }) {
    return _then(_$_HomePageData(
      statusCountings: statusCountings == freezed
          ? _value.statusCountings
          : statusCountings // ignore: cast_nullable_to_non_nullable
              as List<StatusCounting>,
      recentReports: recentReports == freezed
          ? _value.recentReports
          : recentReports // ignore: cast_nullable_to_non_nullable
              as List<Report>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomePageData extends _HomePageData {
  _$_HomePageData(
      {@HiveField(0) required this.statusCountings,
      @HiveField(1) required this.recentReports})
      : super._();

  factory _$_HomePageData.fromJson(Map<String, dynamic> json) =>
      _$$_HomePageDataFromJson(json);

  @override
  @HiveField(0)
  final List<StatusCounting> statusCountings;
  @override
  @HiveField(1)
  final List<Report> recentReports;

  @override
  String toString() {
    return 'HomePageData(statusCountings: $statusCountings, recentReports: $recentReports)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomePageData &&
            const DeepCollectionEquality()
                .equals(other.statusCountings, statusCountings) &&
            const DeepCollectionEquality()
                .equals(other.recentReports, recentReports));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCountings),
      const DeepCollectionEquality().hash(recentReports));

  @JsonKey(ignore: true)
  @override
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      __$$_HomePageDataCopyWithImpl<_$_HomePageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomePageDataToJson(
      this,
    );
  }
}

abstract class _HomePageData extends HomePageData {
  factory _HomePageData(
          {@HiveField(0) required final List<StatusCounting> statusCountings,
          @HiveField(1) required final List<Report> recentReports}) =
      _$_HomePageData;
  _HomePageData._() : super._();

  factory _HomePageData.fromJson(Map<String, dynamic> json) =
      _$_HomePageData.fromJson;

  @override
  @HiveField(0)
  List<StatusCounting> get statusCountings;
  @override
  @HiveField(1)
  List<Report> get recentReports;
  @override
  @JsonKey(ignore: true)
  _$$_HomePageDataCopyWith<_$_HomePageData> get copyWith =>
      throw _privateConstructorUsedError;
}
