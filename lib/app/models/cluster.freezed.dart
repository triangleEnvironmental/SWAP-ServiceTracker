// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cluster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cluster _$ClusterFromJson(Map<String, dynamic> json) {
  return _Cluster.fromJson(json);
}

/// @nodoc
mixin _$Cluster {
  @HiveField(0)
  int? get cid => throw _privateConstructorUsedError;
  @HiveField(1)
  int get count => throw _privateConstructorUsedError;
  @HiveField(2)
  Map<String, dynamic> get bounding => throw _privateConstructorUsedError;
  @HiveField(3)
  Point get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterCopyWith<Cluster> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterCopyWith<$Res> {
  factory $ClusterCopyWith(Cluster value, $Res Function(Cluster) then) =
      _$ClusterCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? cid,
      @HiveField(1) int count,
      @HiveField(2) Map<String, dynamic> bounding,
      @HiveField(3) Point location});

  $PointCopyWith<$Res> get location;
}

/// @nodoc
class _$ClusterCopyWithImpl<$Res> implements $ClusterCopyWith<$Res> {
  _$ClusterCopyWithImpl(this._value, this._then);

  final Cluster _value;
  // ignore: unused_field
  final $Res Function(Cluster) _then;

  @override
  $Res call({
    Object? cid = freezed,
    Object? count = freezed,
    Object? bounding = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      cid: cid == freezed
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as int?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      bounding: bounding == freezed
          ? _value.bounding
          : bounding // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }

  @override
  $PointCopyWith<$Res> get location {
    return $PointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$$_ClusterCopyWith<$Res> implements $ClusterCopyWith<$Res> {
  factory _$$_ClusterCopyWith(
          _$_Cluster value, $Res Function(_$_Cluster) then) =
      __$$_ClusterCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? cid,
      @HiveField(1) int count,
      @HiveField(2) Map<String, dynamic> bounding,
      @HiveField(3) Point location});

  @override
  $PointCopyWith<$Res> get location;
}

/// @nodoc
class __$$_ClusterCopyWithImpl<$Res> extends _$ClusterCopyWithImpl<$Res>
    implements _$$_ClusterCopyWith<$Res> {
  __$$_ClusterCopyWithImpl(_$_Cluster _value, $Res Function(_$_Cluster) _then)
      : super(_value, (v) => _then(v as _$_Cluster));

  @override
  _$_Cluster get _value => super._value as _$_Cluster;

  @override
  $Res call({
    Object? cid = freezed,
    Object? count = freezed,
    Object? bounding = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_Cluster(
      cid: cid == freezed
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as int?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      bounding: bounding == freezed
          ? _value._bounding
          : bounding // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cluster extends _Cluster {
  _$_Cluster(
      {@HiveField(0) this.cid,
      @HiveField(1) required this.count,
      @HiveField(2) required final Map<String, dynamic> bounding,
      @HiveField(3) required this.location})
      : _bounding = bounding,
        super._();

  factory _$_Cluster.fromJson(Map<String, dynamic> json) =>
      _$$_ClusterFromJson(json);

  @override
  @HiveField(0)
  final int? cid;
  @override
  @HiveField(1)
  final int count;
  final Map<String, dynamic> _bounding;
  @override
  @HiveField(2)
  Map<String, dynamic> get bounding {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bounding);
  }

  @override
  @HiveField(3)
  final Point location;

  @override
  String toString() {
    return 'Cluster(cid: $cid, count: $count, bounding: $bounding, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cluster &&
            const DeepCollectionEquality().equals(other.cid, cid) &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other._bounding, _bounding) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cid),
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(_bounding),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_ClusterCopyWith<_$_Cluster> get copyWith =>
      __$$_ClusterCopyWithImpl<_$_Cluster>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClusterToJson(
      this,
    );
  }
}

abstract class _Cluster extends Cluster {
  factory _Cluster(
      {@HiveField(0) final int? cid,
      @HiveField(1) required final int count,
      @HiveField(2) required final Map<String, dynamic> bounding,
      @HiveField(3) required final Point location}) = _$_Cluster;
  _Cluster._() : super._();

  factory _Cluster.fromJson(Map<String, dynamic> json) = _$_Cluster.fromJson;

  @override
  @HiveField(0)
  int? get cid;
  @override
  @HiveField(1)
  int get count;
  @override
  @HiveField(2)
  Map<String, dynamic> get bounding;
  @override
  @HiveField(3)
  Point get location;
  @override
  @JsonKey(ignore: true)
  _$$_ClusterCopyWith<_$_Cluster> get copyWith =>
      throw _privateConstructorUsedError;
}
