// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPreset _$NotificationPresetFromJson(Map<String, dynamic> json) {
  return _NotificationPreset.fromJson(json);
}

/// @nodoc
mixin _$NotificationPreset {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get institutionId => throw _privateConstructorUsedError;
  @HiveField(4)
  Institution? get institution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPresetCopyWith<NotificationPreset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPresetCopyWith<$Res> {
  factory $NotificationPresetCopyWith(
          NotificationPreset value, $Res Function(NotificationPreset) then) =
      _$NotificationPresetCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? title,
      @HiveField(2) String? description,
      @HiveField(3) int? institutionId,
      @HiveField(4) Institution? institution});

  $InstitutionCopyWith<$Res>? get institution;
}

/// @nodoc
class _$NotificationPresetCopyWithImpl<$Res>
    implements $NotificationPresetCopyWith<$Res> {
  _$NotificationPresetCopyWithImpl(this._value, this._then);

  final NotificationPreset _value;
  // ignore: unused_field
  final $Res Function(NotificationPreset) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? institutionId = freezed,
    Object? institution = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: institutionId == freezed
          ? _value.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
    ));
  }

  @override
  $InstitutionCopyWith<$Res>? get institution {
    if (_value.institution == null) {
      return null;
    }

    return $InstitutionCopyWith<$Res>(_value.institution!, (value) {
      return _then(_value.copyWith(institution: value));
    });
  }
}

/// @nodoc
abstract class _$$_NotificationPresetCopyWith<$Res>
    implements $NotificationPresetCopyWith<$Res> {
  factory _$$_NotificationPresetCopyWith(_$_NotificationPreset value,
          $Res Function(_$_NotificationPreset) then) =
      __$$_NotificationPresetCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? title,
      @HiveField(2) String? description,
      @HiveField(3) int? institutionId,
      @HiveField(4) Institution? institution});

  @override
  $InstitutionCopyWith<$Res>? get institution;
}

/// @nodoc
class __$$_NotificationPresetCopyWithImpl<$Res>
    extends _$NotificationPresetCopyWithImpl<$Res>
    implements _$$_NotificationPresetCopyWith<$Res> {
  __$$_NotificationPresetCopyWithImpl(
      _$_NotificationPreset _value, $Res Function(_$_NotificationPreset) _then)
      : super(_value, (v) => _then(v as _$_NotificationPreset));

  @override
  _$_NotificationPreset get _value => super._value as _$_NotificationPreset;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? institutionId = freezed,
    Object? institution = freezed,
  }) {
    return _then(_$_NotificationPreset(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      institutionId: institutionId == freezed
          ? _value.institutionId
          : institutionId // ignore: cast_nullable_to_non_nullable
              as int?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPreset extends _NotificationPreset {
  _$_NotificationPreset(
      {@HiveField(0) required this.id,
      @HiveField(1) this.title,
      @HiveField(2) this.description,
      @HiveField(3) this.institutionId,
      @HiveField(4) this.institution})
      : super._();

  factory _$_NotificationPreset.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPresetFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String? title;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final int? institutionId;
  @override
  @HiveField(4)
  final Institution? institution;

  @override
  String toString() {
    return 'NotificationPreset(id: $id, title: $title, description: $description, institutionId: $institutionId, institution: $institution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPreset &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.institutionId, institutionId) &&
            const DeepCollectionEquality()
                .equals(other.institution, institution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(institutionId),
      const DeepCollectionEquality().hash(institution));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationPresetCopyWith<_$_NotificationPreset> get copyWith =>
      __$$_NotificationPresetCopyWithImpl<_$_NotificationPreset>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPresetToJson(
      this,
    );
  }
}

abstract class _NotificationPreset extends NotificationPreset {
  factory _NotificationPreset(
      {@HiveField(0) required final int id,
      @HiveField(1) final String? title,
      @HiveField(2) final String? description,
      @HiveField(3) final int? institutionId,
      @HiveField(4) final Institution? institution}) = _$_NotificationPreset;
  _NotificationPreset._() : super._();

  factory _NotificationPreset.fromJson(Map<String, dynamic> json) =
      _$_NotificationPreset.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String? get title;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  int? get institutionId;
  @override
  @HiveField(4)
  Institution? get institution;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationPresetCopyWith<_$_NotificationPreset> get copyWith =>
      throw _privateConstructorUsedError;
}
