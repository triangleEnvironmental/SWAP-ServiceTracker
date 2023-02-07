// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sector _$SectorFromJson(Map<String, dynamic> json) {
  return _Sector.fromJson(json);
}

/// @nodoc
mixin _$Sector {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get iconPath => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get iconUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  List<ReportType>? get reportTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SectorCopyWith<Sector> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SectorCopyWith<$Res> {
  factory $SectorCopyWith(Sector value, $Res Function(Sector) then) =
      _$SectorCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? iconPath,
      @HiveField(4) String? iconUrl,
      @HiveField(5) List<ReportType>? reportTypes});
}

/// @nodoc
class _$SectorCopyWithImpl<$Res> implements $SectorCopyWith<$Res> {
  _$SectorCopyWithImpl(this._value, this._then);

  final Sector _value;
  // ignore: unused_field
  final $Res Function(Sector) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? iconPath = freezed,
    Object? iconUrl = freezed,
    Object? reportTypes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: iconPath == freezed
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reportTypes: reportTypes == freezed
          ? _value.reportTypes
          : reportTypes // ignore: cast_nullable_to_non_nullable
              as List<ReportType>?,
    ));
  }
}

/// @nodoc
abstract class _$$_SectorCopyWith<$Res> implements $SectorCopyWith<$Res> {
  factory _$$_SectorCopyWith(_$_Sector value, $Res Function(_$_Sector) then) =
      __$$_SectorCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? iconPath,
      @HiveField(4) String? iconUrl,
      @HiveField(5) List<ReportType>? reportTypes});
}

/// @nodoc
class __$$_SectorCopyWithImpl<$Res> extends _$SectorCopyWithImpl<$Res>
    implements _$$_SectorCopyWith<$Res> {
  __$$_SectorCopyWithImpl(_$_Sector _value, $Res Function(_$_Sector) _then)
      : super(_value, (v) => _then(v as _$_Sector));

  @override
  _$_Sector get _value => super._value as _$_Sector;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? iconPath = freezed,
    Object? iconUrl = freezed,
    Object? reportTypes = freezed,
  }) {
    return _then(_$_Sector(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameEn: nameEn == freezed
          ? _value.nameEn
          : nameEn // ignore: cast_nullable_to_non_nullable
              as String,
      nameKm: nameKm == freezed
          ? _value.nameKm
          : nameKm // ignore: cast_nullable_to_non_nullable
              as String?,
      iconPath: iconPath == freezed
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: iconUrl == freezed
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reportTypes: reportTypes == freezed
          ? _value._reportTypes
          : reportTypes // ignore: cast_nullable_to_non_nullable
              as List<ReportType>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sector extends _Sector {
  _$_Sector(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm,
      @HiveField(3) this.iconPath,
      @HiveField(4) this.iconUrl,
      @HiveField(5) final List<ReportType>? reportTypes})
      : _reportTypes = reportTypes,
        super._();

  factory _$_Sector.fromJson(Map<String, dynamic> json) =>
      _$$_SectorFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String nameEn;
  @override
  @HiveField(2)
  final String? nameKm;
  @override
  @HiveField(3)
  final String? iconPath;
  @override
  @HiveField(4)
  final String? iconUrl;
  final List<ReportType>? _reportTypes;
  @override
  @HiveField(5)
  List<ReportType>? get reportTypes {
    final value = _reportTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Sector(id: $id, nameEn: $nameEn, nameKm: $nameKm, iconPath: $iconPath, iconUrl: $iconUrl, reportTypes: $reportTypes)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_SectorCopyWith<_$_Sector> get copyWith =>
      __$$_SectorCopyWithImpl<_$_Sector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SectorToJson(
      this,
    );
  }
}

abstract class _Sector extends Sector {
  factory _Sector(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm,
      @HiveField(3) final String? iconPath,
      @HiveField(4) final String? iconUrl,
      @HiveField(5) final List<ReportType>? reportTypes}) = _$_Sector;
  _Sector._() : super._();

  factory _Sector.fromJson(Map<String, dynamic> json) = _$_Sector.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get nameEn;
  @override
  @HiveField(2)
  String? get nameKm;
  @override
  @HiveField(3)
  String? get iconPath;
  @override
  @HiveField(4)
  String? get iconUrl;
  @override
  @HiveField(5)
  List<ReportType>? get reportTypes;
  @override
  @JsonKey(ignore: true)
  _$$_SectorCopyWith<_$_Sector> get copyWith =>
      throw _privateConstructorUsedError;
}
