// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get path => throw _privateConstructorUsedError;
  @HiveField(2)
  String get mediaUrl => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get mediableType => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get mediableId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? path,
      @HiveField(2) String mediaUrl,
      @HiveField(3) String? mediableType,
      @HiveField(4) int? mediableId});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res> implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  final Media _value;
  // ignore: unused_field
  final $Res Function(Media) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? mediaUrl = freezed,
    Object? mediableType = freezed,
    Object? mediableId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediableType: mediableType == freezed
          ? _value.mediableType
          : mediableType // ignore: cast_nullable_to_non_nullable
              as String?,
      mediableId: mediableId == freezed
          ? _value.mediableId
          : mediableId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? path,
      @HiveField(2) String mediaUrl,
      @HiveField(3) String? mediableType,
      @HiveField(4) int? mediableId});
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, (v) => _then(v as _$_Media));

  @override
  _$_Media get _value => super._value as _$_Media;

  @override
  $Res call({
    Object? id = freezed,
    Object? path = freezed,
    Object? mediaUrl = freezed,
    Object? mediableType = freezed,
    Object? mediableId = freezed,
  }) {
    return _then(_$_Media(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrl: mediaUrl == freezed
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mediableType: mediableType == freezed
          ? _value.mediableType
          : mediableType // ignore: cast_nullable_to_non_nullable
              as String?,
      mediableId: mediableId == freezed
          ? _value.mediableId
          : mediableId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Media extends _Media {
  _$_Media(
      {@HiveField(0) required this.id,
      @HiveField(1) this.path,
      @HiveField(2) required this.mediaUrl,
      @HiveField(3) this.mediableType,
      @HiveField(4) this.mediableId})
      : super._();

  factory _$_Media.fromJson(Map<String, dynamic> json) =>
      _$$_MediaFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String? path;
  @override
  @HiveField(2)
  final String mediaUrl;
  @override
  @HiveField(3)
  final String? mediableType;
  @override
  @HiveField(4)
  final int? mediableId;

  @override
  String toString() {
    return 'Media(id: $id, path: $path, mediaUrl: $mediaUrl, mediableType: $mediableType, mediableId: $mediableId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.mediaUrl, mediaUrl) &&
            const DeepCollectionEquality()
                .equals(other.mediableType, mediableType) &&
            const DeepCollectionEquality()
                .equals(other.mediableId, mediableId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(mediaUrl),
      const DeepCollectionEquality().hash(mediableType),
      const DeepCollectionEquality().hash(mediableId));

  @JsonKey(ignore: true)
  @override
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaToJson(
      this,
    );
  }
}

abstract class _Media extends Media {
  factory _Media(
      {@HiveField(0) required final int id,
      @HiveField(1) final String? path,
      @HiveField(2) required final String mediaUrl,
      @HiveField(3) final String? mediableType,
      @HiveField(4) final int? mediableId}) = _$_Media;
  _Media._() : super._();

  factory _Media.fromJson(Map<String, dynamic> json) = _$_Media.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String? get path;
  @override
  @HiveField(2)
  String get mediaUrl;
  @override
  @HiveField(3)
  String? get mediableType;
  @override
  @HiveField(4)
  int? get mediableId;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}
