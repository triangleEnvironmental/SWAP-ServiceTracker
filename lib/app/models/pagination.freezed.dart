// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return _Pagination.fromJson(json);
}

/// @nodoc
mixin _$Pagination {
  int get currentPage => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get lastPage => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'data',
      fromJson: Pagination.putJsonData,
      toJson: Pagination.getJsonData)
  List<Map<String, dynamic>> get rawData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res>;
  $Res call(
      {int currentPage,
      int? from,
      int? to,
      int total,
      int lastPage,
      int perPage,
      @JsonKey(name: 'data', fromJson: Pagination.putJsonData, toJson: Pagination.getJsonData)
          List<Map<String, dynamic>> rawData});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res> implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  final Pagination _value;
  // ignore: unused_field
  final $Res Function(Pagination) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? total = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      rawData: rawData == freezed
          ? _value.rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaginationCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$_PaginationCopyWith(
          _$_Pagination value, $Res Function(_$_Pagination) then) =
      __$$_PaginationCopyWithImpl<$Res>;
  @override
  $Res call(
      {int currentPage,
      int? from,
      int? to,
      int total,
      int lastPage,
      int perPage,
      @JsonKey(name: 'data', fromJson: Pagination.putJsonData, toJson: Pagination.getJsonData)
          List<Map<String, dynamic>> rawData});
}

/// @nodoc
class __$$_PaginationCopyWithImpl<$Res> extends _$PaginationCopyWithImpl<$Res>
    implements _$$_PaginationCopyWith<$Res> {
  __$$_PaginationCopyWithImpl(
      _$_Pagination _value, $Res Function(_$_Pagination) _then)
      : super(_value, (v) => _then(v as _$_Pagination));

  @override
  _$_Pagination get _value => super._value as _$_Pagination;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? total = freezed,
    Object? lastPage = freezed,
    Object? perPage = freezed,
    Object? rawData = freezed,
  }) {
    return _then(_$_Pagination(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: lastPage == freezed
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      rawData: rawData == freezed
          ? _value._rawData
          : rawData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Pagination extends _Pagination {
  const _$_Pagination(
      {required this.currentPage,
      required this.from,
      required this.to,
      required this.total,
      required this.lastPage,
      required this.perPage,
      @JsonKey(name: 'data', fromJson: Pagination.putJsonData, toJson: Pagination.getJsonData)
          required final List<Map<String, dynamic>> rawData})
      : _rawData = rawData,
        super._();

  factory _$_Pagination.fromJson(Map<String, dynamic> json) =>
      _$$_PaginationFromJson(json);

  @override
  final int currentPage;
  @override
  final int? from;
  @override
  final int? to;
  @override
  final int total;
  @override
  final int lastPage;
  @override
  final int perPage;
  final List<Map<String, dynamic>> _rawData;
  @override
  @JsonKey(
      name: 'data',
      fromJson: Pagination.putJsonData,
      toJson: Pagination.getJsonData)
  List<Map<String, dynamic>> get rawData {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rawData);
  }

  @override
  String toString() {
    return 'Pagination(currentPage: $currentPage, from: $from, to: $to, total: $total, lastPage: $lastPage, perPage: $perPage, rawData: $rawData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pagination &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.lastPage, lastPage) &&
            const DeepCollectionEquality().equals(other.perPage, perPage) &&
            const DeepCollectionEquality().equals(other._rawData, _rawData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(lastPage),
      const DeepCollectionEquality().hash(perPage),
      const DeepCollectionEquality().hash(_rawData));

  @JsonKey(ignore: true)
  @override
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      __$$_PaginationCopyWithImpl<_$_Pagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaginationToJson(
      this,
    );
  }
}

abstract class _Pagination extends Pagination {
  const factory _Pagination(
      {required final int currentPage,
      required final int? from,
      required final int? to,
      required final int total,
      required final int lastPage,
      required final int perPage,
      @JsonKey(name: 'data', fromJson: Pagination.putJsonData, toJson: Pagination.getJsonData)
          required final List<Map<String, dynamic>> rawData}) = _$_Pagination;
  const _Pagination._() : super._();

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$_Pagination.fromJson;

  @override
  int get currentPage;
  @override
  int? get from;
  @override
  int? get to;
  @override
  int get total;
  @override
  int get lastPage;
  @override
  int get perPage;
  @override
  @JsonKey(
      name: 'data',
      fromJson: Pagination.putJsonData,
      toJson: Pagination.getJsonData)
  List<Map<String, dynamic>> get rawData;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationCopyWith<_$_Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}
