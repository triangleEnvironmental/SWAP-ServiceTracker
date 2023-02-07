// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'master_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MasterNotification _$MasterNotificationFromJson(Map<String, dynamic> json) {
  return _MasterNotification.fromJson(json);
}

/// @nodoc
mixin _$MasterNotification {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get notificationableType => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get notificationableId => throw _privateConstructorUsedError;
  @HiveField(5)
  User? get creator => throw _privateConstructorUsedError;
  @HiveField(6)
  Institution? get institution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MasterNotificationCopyWith<MasterNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterNotificationCopyWith<$Res> {
  factory $MasterNotificationCopyWith(
          MasterNotification value, $Res Function(MasterNotification) then) =
      _$MasterNotificationCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String? description,
      @HiveField(3) String? notificationableType,
      @HiveField(4) int? notificationableId,
      @HiveField(5) User? creator,
      @HiveField(6) Institution? institution});

  $UserCopyWith<$Res>? get creator;
  $InstitutionCopyWith<$Res>? get institution;
}

/// @nodoc
class _$MasterNotificationCopyWithImpl<$Res>
    implements $MasterNotificationCopyWith<$Res> {
  _$MasterNotificationCopyWithImpl(this._value, this._then);

  final MasterNotification _value;
  // ignore: unused_field
  final $Res Function(MasterNotification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? notificationableType = freezed,
    Object? notificationableId = freezed,
    Object? creator = freezed,
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
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationableType: notificationableType == freezed
          ? _value.notificationableType
          : notificationableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationableId: notificationableId == freezed
          ? _value.notificationableId
          : notificationableId // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value));
    });
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
abstract class _$$_MasterNotificationCopyWith<$Res>
    implements $MasterNotificationCopyWith<$Res> {
  factory _$$_MasterNotificationCopyWith(_$_MasterNotification value,
          $Res Function(_$_MasterNotification) then) =
      __$$_MasterNotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String title,
      @HiveField(2) String? description,
      @HiveField(3) String? notificationableType,
      @HiveField(4) int? notificationableId,
      @HiveField(5) User? creator,
      @HiveField(6) Institution? institution});

  @override
  $UserCopyWith<$Res>? get creator;
  @override
  $InstitutionCopyWith<$Res>? get institution;
}

/// @nodoc
class __$$_MasterNotificationCopyWithImpl<$Res>
    extends _$MasterNotificationCopyWithImpl<$Res>
    implements _$$_MasterNotificationCopyWith<$Res> {
  __$$_MasterNotificationCopyWithImpl(
      _$_MasterNotification _value, $Res Function(_$_MasterNotification) _then)
      : super(_value, (v) => _then(v as _$_MasterNotification));

  @override
  _$_MasterNotification get _value => super._value as _$_MasterNotification;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? notificationableType = freezed,
    Object? notificationableId = freezed,
    Object? creator = freezed,
    Object? institution = freezed,
  }) {
    return _then(_$_MasterNotification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationableType: notificationableType == freezed
          ? _value.notificationableType
          : notificationableType // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationableId: notificationableId == freezed
          ? _value.notificationableId
          : notificationableId // ignore: cast_nullable_to_non_nullable
              as int?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as User?,
      institution: institution == freezed
          ? _value.institution
          : institution // ignore: cast_nullable_to_non_nullable
              as Institution?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MasterNotification extends _MasterNotification {
  _$_MasterNotification(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) this.description,
      @HiveField(3) this.notificationableType,
      @HiveField(4) this.notificationableId,
      @HiveField(5) this.creator,
      @HiveField(6) this.institution})
      : super._();

  factory _$_MasterNotification.fromJson(Map<String, dynamic> json) =>
      _$$_MasterNotificationFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final String? notificationableType;
  @override
  @HiveField(4)
  final int? notificationableId;
  @override
  @HiveField(5)
  final User? creator;
  @override
  @HiveField(6)
  final Institution? institution;

  @override
  String toString() {
    return 'MasterNotification(id: $id, title: $title, description: $description, notificationableType: $notificationableType, notificationableId: $notificationableId, creator: $creator, institution: $institution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MasterNotification &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.notificationableType, notificationableType) &&
            const DeepCollectionEquality()
                .equals(other.notificationableId, notificationableId) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
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
      const DeepCollectionEquality().hash(notificationableType),
      const DeepCollectionEquality().hash(notificationableId),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(institution));

  @JsonKey(ignore: true)
  @override
  _$$_MasterNotificationCopyWith<_$_MasterNotification> get copyWith =>
      __$$_MasterNotificationCopyWithImpl<_$_MasterNotification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MasterNotificationToJson(
      this,
    );
  }
}

abstract class _MasterNotification extends MasterNotification {
  factory _MasterNotification(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String title,
      @HiveField(2) final String? description,
      @HiveField(3) final String? notificationableType,
      @HiveField(4) final int? notificationableId,
      @HiveField(5) final User? creator,
      @HiveField(6) final Institution? institution}) = _$_MasterNotification;
  _MasterNotification._() : super._();

  factory _MasterNotification.fromJson(Map<String, dynamic> json) =
      _$_MasterNotification.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  String? get notificationableType;
  @override
  @HiveField(4)
  int? get notificationableId;
  @override
  @HiveField(5)
  User? get creator;
  @override
  @HiveField(6)
  Institution? get institution;
  @override
  @JsonKey(ignore: true)
  _$$_MasterNotificationCopyWith<_$_MasterNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
