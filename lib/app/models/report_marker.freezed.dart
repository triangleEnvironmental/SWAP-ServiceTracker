// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_marker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportMarker _$ReportMarkerFromJson(Map<String, dynamic> json) {
  return _ReportMarker.fromJson(json);
}

/// @nodoc
mixin _$ReportMarker {
  @HiveField(0)
  Point get location => throw _privateConstructorUsedError;
  @HiveField(1)
  Cluster? get cluster => throw _privateConstructorUsedError;
  @HiveField(2)
  Report? get report => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportMarkerCopyWith<ReportMarker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportMarkerCopyWith<$Res> {
  factory $ReportMarkerCopyWith(
          ReportMarker value, $Res Function(ReportMarker) then) =
      _$ReportMarkerCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) Point location,
      @HiveField(1) Cluster? cluster,
      @HiveField(2) Report? report});

  $PointCopyWith<$Res> get location;
  $ClusterCopyWith<$Res>? get cluster;
  $ReportCopyWith<$Res>? get report;
}

/// @nodoc
class _$ReportMarkerCopyWithImpl<$Res> implements $ReportMarkerCopyWith<$Res> {
  _$ReportMarkerCopyWithImpl(this._value, this._then);

  final ReportMarker _value;
  // ignore: unused_field
  final $Res Function(ReportMarker) _then;

  @override
  $Res call({
    Object? location = freezed,
    Object? cluster = freezed,
    Object? report = freezed,
  }) {
    return _then(_value.copyWith(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point,
      cluster: cluster == freezed
          ? _value.cluster
          : cluster // ignore: cast_nullable_to_non_nullable
              as Cluster?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report?,
    ));
  }

  @override
  $PointCopyWith<$Res> get location {
    return $PointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $ClusterCopyWith<$Res>? get cluster {
    if (_value.cluster == null) {
      return null;
    }

    return $ClusterCopyWith<$Res>(_value.cluster!, (value) {
      return _then(_value.copyWith(cluster: value));
    });
  }

  @override
  $ReportCopyWith<$Res>? get report {
    if (_value.report == null) {
      return null;
    }

    return $ReportCopyWith<$Res>(_value.report!, (value) {
      return _then(_value.copyWith(report: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReportMarkerCopyWith<$Res>
    implements $ReportMarkerCopyWith<$Res> {
  factory _$$_ReportMarkerCopyWith(
          _$_ReportMarker value, $Res Function(_$_ReportMarker) then) =
      __$$_ReportMarkerCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) Point location,
      @HiveField(1) Cluster? cluster,
      @HiveField(2) Report? report});

  @override
  $PointCopyWith<$Res> get location;
  @override
  $ClusterCopyWith<$Res>? get cluster;
  @override
  $ReportCopyWith<$Res>? get report;
}

/// @nodoc
class __$$_ReportMarkerCopyWithImpl<$Res>
    extends _$ReportMarkerCopyWithImpl<$Res>
    implements _$$_ReportMarkerCopyWith<$Res> {
  __$$_ReportMarkerCopyWithImpl(
      _$_ReportMarker _value, $Res Function(_$_ReportMarker) _then)
      : super(_value, (v) => _then(v as _$_ReportMarker));

  @override
  _$_ReportMarker get _value => super._value as _$_ReportMarker;

  @override
  $Res call({
    Object? location = freezed,
    Object? cluster = freezed,
    Object? report = freezed,
  }) {
    return _then(_$_ReportMarker(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point,
      cluster: cluster == freezed
          ? _value.cluster
          : cluster // ignore: cast_nullable_to_non_nullable
              as Cluster?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportMarker extends _ReportMarker {
  _$_ReportMarker(
      {@HiveField(0) required this.location,
      @HiveField(1) this.cluster,
      @HiveField(2) this.report})
      : super._();

  factory _$_ReportMarker.fromJson(Map<String, dynamic> json) =>
      _$$_ReportMarkerFromJson(json);

  @override
  @HiveField(0)
  final Point location;
  @override
  @HiveField(1)
  final Cluster? cluster;
  @override
  @HiveField(2)
  final Report? report;

  @override
  String toString() {
    return 'ReportMarker(location: $location, cluster: $cluster, report: $report)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportMarker &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.cluster, cluster) &&
            const DeepCollectionEquality().equals(other.report, report));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(cluster),
      const DeepCollectionEquality().hash(report));

  @JsonKey(ignore: true)
  @override
  _$$_ReportMarkerCopyWith<_$_ReportMarker> get copyWith =>
      __$$_ReportMarkerCopyWithImpl<_$_ReportMarker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportMarkerToJson(
      this,
    );
  }
}

abstract class _ReportMarker extends ReportMarker {
  factory _ReportMarker(
      {@HiveField(0) required final Point location,
      @HiveField(1) final Cluster? cluster,
      @HiveField(2) final Report? report}) = _$_ReportMarker;
  _ReportMarker._() : super._();

  factory _ReportMarker.fromJson(Map<String, dynamic> json) =
      _$_ReportMarker.fromJson;

  @override
  @HiveField(0)
  Point get location;
  @override
  @HiveField(1)
  Cluster? get cluster;
  @override
  @HiveField(2)
  Report? get report;
  @override
  @JsonKey(ignore: true)
  _$$_ReportMarkerCopyWith<_$_ReportMarker> get copyWith =>
      throw _privateConstructorUsedError;
}
