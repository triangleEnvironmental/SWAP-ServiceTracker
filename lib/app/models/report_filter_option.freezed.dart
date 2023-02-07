// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report_filter_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportFilterOption _$ReportFilterOptionFromJson(Map<String, dynamic> json) {
  return _ReportFilterOption.fromJson(json);
}

/// @nodoc
mixin _$ReportFilterOption {
  @HiveField(0)
  DateTime get minDate => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Sector> get sectors => throw _privateConstructorUsedError;
  @HiveField(2)
  List<ReportStatus> get statuses => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Area> get provinces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportFilterOptionCopyWith<ReportFilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportFilterOptionCopyWith<$Res> {
  factory $ReportFilterOptionCopyWith(
          ReportFilterOption value, $Res Function(ReportFilterOption) then) =
      _$ReportFilterOptionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) DateTime minDate,
      @HiveField(1) List<Sector> sectors,
      @HiveField(2) List<ReportStatus> statuses,
      @HiveField(3) List<Area> provinces});
}

/// @nodoc
class _$ReportFilterOptionCopyWithImpl<$Res>
    implements $ReportFilterOptionCopyWith<$Res> {
  _$ReportFilterOptionCopyWithImpl(this._value, this._then);

  final ReportFilterOption _value;
  // ignore: unused_field
  final $Res Function(ReportFilterOption) _then;

  @override
  $Res call({
    Object? minDate = freezed,
    Object? sectors = freezed,
    Object? statuses = freezed,
    Object? provinces = freezed,
  }) {
    return _then(_value.copyWith(
      minDate: minDate == freezed
          ? _value.minDate
          : minDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>,
      statuses: statuses == freezed
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ReportStatus>,
      provinces: provinces == freezed
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Area>,
    ));
  }
}

/// @nodoc
abstract class _$$_ReportFilterOptionCopyWith<$Res>
    implements $ReportFilterOptionCopyWith<$Res> {
  factory _$$_ReportFilterOptionCopyWith(_$_ReportFilterOption value,
          $Res Function(_$_ReportFilterOption) then) =
      __$$_ReportFilterOptionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) DateTime minDate,
      @HiveField(1) List<Sector> sectors,
      @HiveField(2) List<ReportStatus> statuses,
      @HiveField(3) List<Area> provinces});
}

/// @nodoc
class __$$_ReportFilterOptionCopyWithImpl<$Res>
    extends _$ReportFilterOptionCopyWithImpl<$Res>
    implements _$$_ReportFilterOptionCopyWith<$Res> {
  __$$_ReportFilterOptionCopyWithImpl(
      _$_ReportFilterOption _value, $Res Function(_$_ReportFilterOption) _then)
      : super(_value, (v) => _then(v as _$_ReportFilterOption));

  @override
  _$_ReportFilterOption get _value => super._value as _$_ReportFilterOption;

  @override
  $Res call({
    Object? minDate = freezed,
    Object? sectors = freezed,
    Object? statuses = freezed,
    Object? provinces = freezed,
  }) {
    return _then(_$_ReportFilterOption(
      minDate: minDate == freezed
          ? _value.minDate
          : minDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sectors: sectors == freezed
          ? _value._sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>,
      statuses: statuses == freezed
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<ReportStatus>,
      provinces: provinces == freezed
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Area>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportFilterOption extends _ReportFilterOption {
  _$_ReportFilterOption(
      {@HiveField(0) required this.minDate,
      @HiveField(1) required final List<Sector> sectors,
      @HiveField(2) required final List<ReportStatus> statuses,
      @HiveField(3) required final List<Area> provinces})
      : _sectors = sectors,
        _statuses = statuses,
        _provinces = provinces,
        super._();

  factory _$_ReportFilterOption.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFilterOptionFromJson(json);

  @override
  @HiveField(0)
  final DateTime minDate;
  final List<Sector> _sectors;
  @override
  @HiveField(1)
  List<Sector> get sectors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sectors);
  }

  final List<ReportStatus> _statuses;
  @override
  @HiveField(2)
  List<ReportStatus> get statuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  final List<Area> _provinces;
  @override
  @HiveField(3)
  List<Area> get provinces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  @override
  String toString() {
    return 'ReportFilterOption(minDate: $minDate, sectors: $sectors, statuses: $statuses, provinces: $provinces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportFilterOption &&
            const DeepCollectionEquality().equals(other.minDate, minDate) &&
            const DeepCollectionEquality().equals(other._sectors, _sectors) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses) &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(minDate),
      const DeepCollectionEquality().hash(_sectors),
      const DeepCollectionEquality().hash(_statuses),
      const DeepCollectionEquality().hash(_provinces));

  @JsonKey(ignore: true)
  @override
  _$$_ReportFilterOptionCopyWith<_$_ReportFilterOption> get copyWith =>
      __$$_ReportFilterOptionCopyWithImpl<_$_ReportFilterOption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportFilterOptionToJson(
      this,
    );
  }
}

abstract class _ReportFilterOption extends ReportFilterOption {
  factory _ReportFilterOption(
          {@HiveField(0) required final DateTime minDate,
          @HiveField(1) required final List<Sector> sectors,
          @HiveField(2) required final List<ReportStatus> statuses,
          @HiveField(3) required final List<Area> provinces}) =
      _$_ReportFilterOption;
  _ReportFilterOption._() : super._();

  factory _ReportFilterOption.fromJson(Map<String, dynamic> json) =
      _$_ReportFilterOption.fromJson;

  @override
  @HiveField(0)
  DateTime get minDate;
  @override
  @HiveField(1)
  List<Sector> get sectors;
  @override
  @HiveField(2)
  List<ReportStatus> get statuses;
  @override
  @HiveField(3)
  List<Area> get provinces;
  @override
  @JsonKey(ignore: true)
  _$$_ReportFilterOptionCopyWith<_$_ReportFilterOption> get copyWith =>
      throw _privateConstructorUsedError;
}
