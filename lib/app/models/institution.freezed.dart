// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'institution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Institution _$InstitutionFromJson(Map<String, dynamic> json) {
  return _Institution.fromJson(json);
}

/// @nodoc
mixin _$Institution {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get nameEn => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get nameKm => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get logoPath => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get logoUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  List<Sector>? get sectors => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get isMunicipality => throw _privateConstructorUsedError;
  @HiveField(7)
  bool? get isServiceProvider => throw _privateConstructorUsedError;
  @HiveField(8)
  List<User>? get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstitutionCopyWith<Institution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstitutionCopyWith<$Res> {
  factory $InstitutionCopyWith(
          Institution value, $Res Function(Institution) then) =
      _$InstitutionCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? logoPath,
      @HiveField(4) String? logoUrl,
      @HiveField(5) List<Sector>? sectors,
      @HiveField(6) bool? isMunicipality,
      @HiveField(7) bool? isServiceProvider,
      @HiveField(8) List<User>? users});
}

/// @nodoc
class _$InstitutionCopyWithImpl<$Res> implements $InstitutionCopyWith<$Res> {
  _$InstitutionCopyWithImpl(this._value, this._then);

  final Institution _value;
  // ignore: unused_field
  final $Res Function(Institution) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? logoPath = freezed,
    Object? logoUrl = freezed,
    Object? sectors = freezed,
    Object? isMunicipality = freezed,
    Object? isServiceProvider = freezed,
    Object? users = freezed,
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
      logoPath: logoPath == freezed
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sectors: sectors == freezed
          ? _value.sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>?,
      isMunicipality: isMunicipality == freezed
          ? _value.isMunicipality
          : isMunicipality // ignore: cast_nullable_to_non_nullable
              as bool?,
      isServiceProvider: isServiceProvider == freezed
          ? _value.isServiceProvider
          : isServiceProvider // ignore: cast_nullable_to_non_nullable
              as bool?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
abstract class _$$_InstitutionCopyWith<$Res>
    implements $InstitutionCopyWith<$Res> {
  factory _$$_InstitutionCopyWith(
          _$_Institution value, $Res Function(_$_Institution) then) =
      __$$_InstitutionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String nameEn,
      @HiveField(2) String? nameKm,
      @HiveField(3) String? logoPath,
      @HiveField(4) String? logoUrl,
      @HiveField(5) List<Sector>? sectors,
      @HiveField(6) bool? isMunicipality,
      @HiveField(7) bool? isServiceProvider,
      @HiveField(8) List<User>? users});
}

/// @nodoc
class __$$_InstitutionCopyWithImpl<$Res> extends _$InstitutionCopyWithImpl<$Res>
    implements _$$_InstitutionCopyWith<$Res> {
  __$$_InstitutionCopyWithImpl(
      _$_Institution _value, $Res Function(_$_Institution) _then)
      : super(_value, (v) => _then(v as _$_Institution));

  @override
  _$_Institution get _value => super._value as _$_Institution;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameEn = freezed,
    Object? nameKm = freezed,
    Object? logoPath = freezed,
    Object? logoUrl = freezed,
    Object? sectors = freezed,
    Object? isMunicipality = freezed,
    Object? isServiceProvider = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_Institution(
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
      logoPath: logoPath == freezed
          ? _value.logoPath
          : logoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: logoUrl == freezed
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      sectors: sectors == freezed
          ? _value._sectors
          : sectors // ignore: cast_nullable_to_non_nullable
              as List<Sector>?,
      isMunicipality: isMunicipality == freezed
          ? _value.isMunicipality
          : isMunicipality // ignore: cast_nullable_to_non_nullable
              as bool?,
      isServiceProvider: isServiceProvider == freezed
          ? _value.isServiceProvider
          : isServiceProvider // ignore: cast_nullable_to_non_nullable
              as bool?,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Institution extends _Institution {
  _$_Institution(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.nameEn,
      @HiveField(2) this.nameKm,
      @HiveField(3) this.logoPath,
      @HiveField(4) this.logoUrl,
      @HiveField(5) final List<Sector>? sectors,
      @HiveField(6) this.isMunicipality,
      @HiveField(7) this.isServiceProvider,
      @HiveField(8) final List<User>? users})
      : _sectors = sectors,
        _users = users,
        super._();

  factory _$_Institution.fromJson(Map<String, dynamic> json) =>
      _$$_InstitutionFromJson(json);

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
  final String? logoPath;
  @override
  @HiveField(4)
  final String? logoUrl;
  final List<Sector>? _sectors;
  @override
  @HiveField(5)
  List<Sector>? get sectors {
    final value = _sectors;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(6)
  final bool? isMunicipality;
  @override
  @HiveField(7)
  final bool? isServiceProvider;
  final List<User>? _users;
  @override
  @HiveField(8)
  List<User>? get users {
    final value = _users;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Institution(id: $id, nameEn: $nameEn, nameKm: $nameKm, logoPath: $logoPath, logoUrl: $logoUrl, sectors: $sectors, isMunicipality: $isMunicipality, isServiceProvider: $isServiceProvider, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Institution &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.nameEn, nameEn) &&
            const DeepCollectionEquality().equals(other.nameKm, nameKm) &&
            const DeepCollectionEquality().equals(other.logoPath, logoPath) &&
            const DeepCollectionEquality().equals(other.logoUrl, logoUrl) &&
            const DeepCollectionEquality().equals(other._sectors, _sectors) &&
            const DeepCollectionEquality()
                .equals(other.isMunicipality, isMunicipality) &&
            const DeepCollectionEquality()
                .equals(other.isServiceProvider, isServiceProvider) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(nameEn),
      const DeepCollectionEquality().hash(nameKm),
      const DeepCollectionEquality().hash(logoPath),
      const DeepCollectionEquality().hash(logoUrl),
      const DeepCollectionEquality().hash(_sectors),
      const DeepCollectionEquality().hash(isMunicipality),
      const DeepCollectionEquality().hash(isServiceProvider),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  _$$_InstitutionCopyWith<_$_Institution> get copyWith =>
      __$$_InstitutionCopyWithImpl<_$_Institution>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InstitutionToJson(
      this,
    );
  }
}

abstract class _Institution extends Institution {
  factory _Institution(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String nameEn,
      @HiveField(2) final String? nameKm,
      @HiveField(3) final String? logoPath,
      @HiveField(4) final String? logoUrl,
      @HiveField(5) final List<Sector>? sectors,
      @HiveField(6) final bool? isMunicipality,
      @HiveField(7) final bool? isServiceProvider,
      @HiveField(8) final List<User>? users}) = _$_Institution;
  _Institution._() : super._();

  factory _Institution.fromJson(Map<String, dynamic> json) =
      _$_Institution.fromJson;

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
  String? get logoPath;
  @override
  @HiveField(4)
  String? get logoUrl;
  @override
  @HiveField(5)
  List<Sector>? get sectors;
  @override
  @HiveField(6)
  bool? get isMunicipality;
  @override
  @HiveField(7)
  bool? get isServiceProvider;
  @override
  @HiveField(8)
  List<User>? get users;
  @override
  @JsonKey(ignore: true)
  _$$_InstitutionCopyWith<_$_Institution> get copyWith =>
      throw _privateConstructorUsedError;
}
