// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'moderation_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModerationHistory _$ModerationHistoryFromJson(Map<String, dynamic> json) {
  return _ModerationHistory.fromJson(json);
}

/// @nodoc
mixin _$ModerationHistory {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int? get fromStatusId => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get toStatusId => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get moderatedByUserId => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get masterNotificationId => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  ReportStatus? get fromStatus => throw _privateConstructorUsedError;
  @HiveField(7)
  ReportStatus? get toStatus => throw _privateConstructorUsedError;
  @HiveField(8)
  User? get moderator => throw _privateConstructorUsedError;
  @HiveField(9)
  MasterNotification? get masterNotification =>
      throw _privateConstructorUsedError;
  @HiveField(10)
  Report? get report => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModerationHistoryCopyWith<ModerationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModerationHistoryCopyWith<$Res> {
  factory $ModerationHistoryCopyWith(
          ModerationHistory value, $Res Function(ModerationHistory) then) =
      _$ModerationHistoryCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? fromStatusId,
      @HiveField(2) int? toStatusId,
      @HiveField(3) int? moderatedByUserId,
      @HiveField(4) int? masterNotificationId,
      @HiveField(5) DateTime? createdAt,
      @HiveField(6) ReportStatus? fromStatus,
      @HiveField(7) ReportStatus? toStatus,
      @HiveField(8) User? moderator,
      @HiveField(9) MasterNotification? masterNotification,
      @HiveField(10) Report? report});

  $ReportStatusCopyWith<$Res>? get fromStatus;
  $ReportStatusCopyWith<$Res>? get toStatus;
  $UserCopyWith<$Res>? get moderator;
  $MasterNotificationCopyWith<$Res>? get masterNotification;
  $ReportCopyWith<$Res>? get report;
}

/// @nodoc
class _$ModerationHistoryCopyWithImpl<$Res>
    implements $ModerationHistoryCopyWith<$Res> {
  _$ModerationHistoryCopyWithImpl(this._value, this._then);

  final ModerationHistory _value;
  // ignore: unused_field
  final $Res Function(ModerationHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromStatusId = freezed,
    Object? toStatusId = freezed,
    Object? moderatedByUserId = freezed,
    Object? masterNotificationId = freezed,
    Object? createdAt = freezed,
    Object? fromStatus = freezed,
    Object? toStatus = freezed,
    Object? moderator = freezed,
    Object? masterNotification = freezed,
    Object? report = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fromStatusId: fromStatusId == freezed
          ? _value.fromStatusId
          : fromStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      toStatusId: toStatusId == freezed
          ? _value.toStatusId
          : toStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      moderatedByUserId: moderatedByUserId == freezed
          ? _value.moderatedByUserId
          : moderatedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterNotificationId: masterNotificationId == freezed
          ? _value.masterNotificationId
          : masterNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromStatus: fromStatus == freezed
          ? _value.fromStatus
          : fromStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      toStatus: toStatus == freezed
          ? _value.toStatus
          : toStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      moderator: moderator == freezed
          ? _value.moderator
          : moderator // ignore: cast_nullable_to_non_nullable
              as User?,
      masterNotification: masterNotification == freezed
          ? _value.masterNotification
          : masterNotification // ignore: cast_nullable_to_non_nullable
              as MasterNotification?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report?,
    ));
  }

  @override
  $ReportStatusCopyWith<$Res>? get fromStatus {
    if (_value.fromStatus == null) {
      return null;
    }

    return $ReportStatusCopyWith<$Res>(_value.fromStatus!, (value) {
      return _then(_value.copyWith(fromStatus: value));
    });
  }

  @override
  $ReportStatusCopyWith<$Res>? get toStatus {
    if (_value.toStatus == null) {
      return null;
    }

    return $ReportStatusCopyWith<$Res>(_value.toStatus!, (value) {
      return _then(_value.copyWith(toStatus: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get moderator {
    if (_value.moderator == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.moderator!, (value) {
      return _then(_value.copyWith(moderator: value));
    });
  }

  @override
  $MasterNotificationCopyWith<$Res>? get masterNotification {
    if (_value.masterNotification == null) {
      return null;
    }

    return $MasterNotificationCopyWith<$Res>(_value.masterNotification!,
        (value) {
      return _then(_value.copyWith(masterNotification: value));
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
abstract class _$$_ModerationHistoryCopyWith<$Res>
    implements $ModerationHistoryCopyWith<$Res> {
  factory _$$_ModerationHistoryCopyWith(_$_ModerationHistory value,
          $Res Function(_$_ModerationHistory) then) =
      __$$_ModerationHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) int? fromStatusId,
      @HiveField(2) int? toStatusId,
      @HiveField(3) int? moderatedByUserId,
      @HiveField(4) int? masterNotificationId,
      @HiveField(5) DateTime? createdAt,
      @HiveField(6) ReportStatus? fromStatus,
      @HiveField(7) ReportStatus? toStatus,
      @HiveField(8) User? moderator,
      @HiveField(9) MasterNotification? masterNotification,
      @HiveField(10) Report? report});

  @override
  $ReportStatusCopyWith<$Res>? get fromStatus;
  @override
  $ReportStatusCopyWith<$Res>? get toStatus;
  @override
  $UserCopyWith<$Res>? get moderator;
  @override
  $MasterNotificationCopyWith<$Res>? get masterNotification;
  @override
  $ReportCopyWith<$Res>? get report;
}

/// @nodoc
class __$$_ModerationHistoryCopyWithImpl<$Res>
    extends _$ModerationHistoryCopyWithImpl<$Res>
    implements _$$_ModerationHistoryCopyWith<$Res> {
  __$$_ModerationHistoryCopyWithImpl(
      _$_ModerationHistory _value, $Res Function(_$_ModerationHistory) _then)
      : super(_value, (v) => _then(v as _$_ModerationHistory));

  @override
  _$_ModerationHistory get _value => super._value as _$_ModerationHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? fromStatusId = freezed,
    Object? toStatusId = freezed,
    Object? moderatedByUserId = freezed,
    Object? masterNotificationId = freezed,
    Object? createdAt = freezed,
    Object? fromStatus = freezed,
    Object? toStatus = freezed,
    Object? moderator = freezed,
    Object? masterNotification = freezed,
    Object? report = freezed,
  }) {
    return _then(_$_ModerationHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fromStatusId: fromStatusId == freezed
          ? _value.fromStatusId
          : fromStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      toStatusId: toStatusId == freezed
          ? _value.toStatusId
          : toStatusId // ignore: cast_nullable_to_non_nullable
              as int?,
      moderatedByUserId: moderatedByUserId == freezed
          ? _value.moderatedByUserId
          : moderatedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterNotificationId: masterNotificationId == freezed
          ? _value.masterNotificationId
          : masterNotificationId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fromStatus: fromStatus == freezed
          ? _value.fromStatus
          : fromStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      toStatus: toStatus == freezed
          ? _value.toStatus
          : toStatus // ignore: cast_nullable_to_non_nullable
              as ReportStatus?,
      moderator: moderator == freezed
          ? _value.moderator
          : moderator // ignore: cast_nullable_to_non_nullable
              as User?,
      masterNotification: masterNotification == freezed
          ? _value.masterNotification
          : masterNotification // ignore: cast_nullable_to_non_nullable
              as MasterNotification?,
      report: report == freezed
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as Report?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModerationHistory extends _ModerationHistory {
  _$_ModerationHistory(
      {@HiveField(0) this.id,
      @HiveField(1) this.fromStatusId,
      @HiveField(2) this.toStatusId,
      @HiveField(3) this.moderatedByUserId,
      @HiveField(4) this.masterNotificationId,
      @HiveField(5) this.createdAt,
      @HiveField(6) this.fromStatus,
      @HiveField(7) this.toStatus,
      @HiveField(8) this.moderator,
      @HiveField(9) this.masterNotification,
      @HiveField(10) this.report})
      : super._();

  factory _$_ModerationHistory.fromJson(Map<String, dynamic> json) =>
      _$$_ModerationHistoryFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final int? fromStatusId;
  @override
  @HiveField(2)
  final int? toStatusId;
  @override
  @HiveField(3)
  final int? moderatedByUserId;
  @override
  @HiveField(4)
  final int? masterNotificationId;
  @override
  @HiveField(5)
  final DateTime? createdAt;
  @override
  @HiveField(6)
  final ReportStatus? fromStatus;
  @override
  @HiveField(7)
  final ReportStatus? toStatus;
  @override
  @HiveField(8)
  final User? moderator;
  @override
  @HiveField(9)
  final MasterNotification? masterNotification;
  @override
  @HiveField(10)
  final Report? report;

  @override
  String toString() {
    return 'ModerationHistory(id: $id, fromStatusId: $fromStatusId, toStatusId: $toStatusId, moderatedByUserId: $moderatedByUserId, masterNotificationId: $masterNotificationId, createdAt: $createdAt, fromStatus: $fromStatus, toStatus: $toStatus, moderator: $moderator, masterNotification: $masterNotification, report: $report)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModerationHistory &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.fromStatusId, fromStatusId) &&
            const DeepCollectionEquality()
                .equals(other.toStatusId, toStatusId) &&
            const DeepCollectionEquality()
                .equals(other.moderatedByUserId, moderatedByUserId) &&
            const DeepCollectionEquality()
                .equals(other.masterNotificationId, masterNotificationId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.fromStatus, fromStatus) &&
            const DeepCollectionEquality().equals(other.toStatus, toStatus) &&
            const DeepCollectionEquality().equals(other.moderator, moderator) &&
            const DeepCollectionEquality()
                .equals(other.masterNotification, masterNotification) &&
            const DeepCollectionEquality().equals(other.report, report));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(fromStatusId),
      const DeepCollectionEquality().hash(toStatusId),
      const DeepCollectionEquality().hash(moderatedByUserId),
      const DeepCollectionEquality().hash(masterNotificationId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(fromStatus),
      const DeepCollectionEquality().hash(toStatus),
      const DeepCollectionEquality().hash(moderator),
      const DeepCollectionEquality().hash(masterNotification),
      const DeepCollectionEquality().hash(report));

  @JsonKey(ignore: true)
  @override
  _$$_ModerationHistoryCopyWith<_$_ModerationHistory> get copyWith =>
      __$$_ModerationHistoryCopyWithImpl<_$_ModerationHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModerationHistoryToJson(
      this,
    );
  }
}

abstract class _ModerationHistory extends ModerationHistory {
  factory _ModerationHistory(
      {@HiveField(0) final int? id,
      @HiveField(1) final int? fromStatusId,
      @HiveField(2) final int? toStatusId,
      @HiveField(3) final int? moderatedByUserId,
      @HiveField(4) final int? masterNotificationId,
      @HiveField(5) final DateTime? createdAt,
      @HiveField(6) final ReportStatus? fromStatus,
      @HiveField(7) final ReportStatus? toStatus,
      @HiveField(8) final User? moderator,
      @HiveField(9) final MasterNotification? masterNotification,
      @HiveField(10) final Report? report}) = _$_ModerationHistory;
  _ModerationHistory._() : super._();

  factory _ModerationHistory.fromJson(Map<String, dynamic> json) =
      _$_ModerationHistory.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  int? get fromStatusId;
  @override
  @HiveField(2)
  int? get toStatusId;
  @override
  @HiveField(3)
  int? get moderatedByUserId;
  @override
  @HiveField(4)
  int? get masterNotificationId;
  @override
  @HiveField(5)
  DateTime? get createdAt;
  @override
  @HiveField(6)
  ReportStatus? get fromStatus;
  @override
  @HiveField(7)
  ReportStatus? get toStatus;
  @override
  @HiveField(8)
  User? get moderator;
  @override
  @HiveField(9)
  MasterNotification? get masterNotification;
  @override
  @HiveField(10)
  Report? get report;
  @override
  @JsonKey(ignore: true)
  _$$_ModerationHistoryCopyWith<_$_ModerationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
