// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'html_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HtmlPage _$HtmlPageFromJson(Map<String, dynamic> json) {
  return _HtmlPage.fromJson(json);
}

/// @nodoc
mixin _$HtmlPage {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get key => throw _privateConstructorUsedError;
  @HiveField(2)
  String get contentEn => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get contentKm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HtmlPageCopyWith<HtmlPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HtmlPageCopyWith<$Res> {
  factory $HtmlPageCopyWith(HtmlPage value, $Res Function(HtmlPage) then) =
      _$HtmlPageCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String key,
      @HiveField(2) String contentEn,
      @HiveField(3) String? contentKm});
}

/// @nodoc
class _$HtmlPageCopyWithImpl<$Res> implements $HtmlPageCopyWith<$Res> {
  _$HtmlPageCopyWithImpl(this._value, this._then);

  final HtmlPage _value;
  // ignore: unused_field
  final $Res Function(HtmlPage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? contentEn = freezed,
    Object? contentKm = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: contentEn == freezed
          ? _value.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentKm: contentKm == freezed
          ? _value.contentKm
          : contentKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_HtmlPageCopyWith<$Res> implements $HtmlPageCopyWith<$Res> {
  factory _$$_HtmlPageCopyWith(
          _$_HtmlPage value, $Res Function(_$_HtmlPage) then) =
      __$$_HtmlPageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String key,
      @HiveField(2) String contentEn,
      @HiveField(3) String? contentKm});
}

/// @nodoc
class __$$_HtmlPageCopyWithImpl<$Res> extends _$HtmlPageCopyWithImpl<$Res>
    implements _$$_HtmlPageCopyWith<$Res> {
  __$$_HtmlPageCopyWithImpl(
      _$_HtmlPage _value, $Res Function(_$_HtmlPage) _then)
      : super(_value, (v) => _then(v as _$_HtmlPage));

  @override
  _$_HtmlPage get _value => super._value as _$_HtmlPage;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? contentEn = freezed,
    Object? contentKm = freezed,
  }) {
    return _then(_$_HtmlPage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      contentEn: contentEn == freezed
          ? _value.contentEn
          : contentEn // ignore: cast_nullable_to_non_nullable
              as String,
      contentKm: contentKm == freezed
          ? _value.contentKm
          : contentKm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HtmlPage extends _HtmlPage {
  _$_HtmlPage(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.key,
      @HiveField(2) required this.contentEn,
      @HiveField(3) required this.contentKm})
      : super._();

  factory _$_HtmlPage.fromJson(Map<String, dynamic> json) =>
      _$$_HtmlPageFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String key;
  @override
  @HiveField(2)
  final String contentEn;
  @override
  @HiveField(3)
  final String? contentKm;

  @override
  String toString() {
    return 'HtmlPage(id: $id, key: $key, contentEn: $contentEn, contentKm: $contentKm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HtmlPage &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.contentEn, contentEn) &&
            const DeepCollectionEquality().equals(other.contentKm, contentKm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(contentEn),
      const DeepCollectionEquality().hash(contentKm));

  @JsonKey(ignore: true)
  @override
  _$$_HtmlPageCopyWith<_$_HtmlPage> get copyWith =>
      __$$_HtmlPageCopyWithImpl<_$_HtmlPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HtmlPageToJson(
      this,
    );
  }
}

abstract class _HtmlPage extends HtmlPage {
  factory _HtmlPage(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String key,
      @HiveField(2) required final String contentEn,
      @HiveField(3) required final String? contentKm}) = _$_HtmlPage;
  _HtmlPage._() : super._();

  factory _HtmlPage.fromJson(Map<String, dynamic> json) = _$_HtmlPage.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get key;
  @override
  @HiveField(2)
  String get contentEn;
  @override
  @HiveField(3)
  String? get contentKm;
  @override
  @JsonKey(ignore: true)
  _$$_HtmlPageCopyWith<_$_HtmlPage> get copyWith =>
      throw _privateConstructorUsedError;
}
