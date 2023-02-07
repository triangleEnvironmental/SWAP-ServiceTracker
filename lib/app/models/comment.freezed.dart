// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get text => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get reportId => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get commentedByUserId => throw _privateConstructorUsedError;
  @HiveField(4)
  bool? get isPublic => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  List<Media>? get medias => throw _privateConstructorUsedError;
  @HiveField(7)
  User? get commenter => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get canDelete => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? text,
      @HiveField(2) int? reportId,
      @HiveField(3) int? commentedByUserId,
      @HiveField(4) bool? isPublic,
      @HiveField(5) DateTime? createdAt,
      @HiveField(6) List<Media>? medias,
      @HiveField(7) User? commenter,
      @HiveField(8) bool? canDelete});

  $UserCopyWith<$Res>? get commenter;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? reportId = freezed,
    Object? commentedByUserId = freezed,
    Object? isPublic = freezed,
    Object? createdAt = freezed,
    Object? medias = freezed,
    Object? commenter = freezed,
    Object? canDelete = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      reportId: reportId == freezed
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as int?,
      commentedByUserId: commentedByUserId == freezed
          ? _value.commentedByUserId
          : commentedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      medias: medias == freezed
          ? _value.medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      commenter: commenter == freezed
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as User?,
      canDelete: canDelete == freezed
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get commenter {
    if (_value.commenter == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.commenter!, (value) {
      return _then(_value.copyWith(commenter: value));
    });
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String? text,
      @HiveField(2) int? reportId,
      @HiveField(3) int? commentedByUserId,
      @HiveField(4) bool? isPublic,
      @HiveField(5) DateTime? createdAt,
      @HiveField(6) List<Media>? medias,
      @HiveField(7) User? commenter,
      @HiveField(8) bool? canDelete});

  @override
  $UserCopyWith<$Res>? get commenter;
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, (v) => _then(v as _$_Comment));

  @override
  _$_Comment get _value => super._value as _$_Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? reportId = freezed,
    Object? commentedByUserId = freezed,
    Object? isPublic = freezed,
    Object? createdAt = freezed,
    Object? medias = freezed,
    Object? commenter = freezed,
    Object? canDelete = freezed,
  }) {
    return _then(_$_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      reportId: reportId == freezed
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as int?,
      commentedByUserId: commentedByUserId == freezed
          ? _value.commentedByUserId
          : commentedByUserId // ignore: cast_nullable_to_non_nullable
              as int?,
      isPublic: isPublic == freezed
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      medias: medias == freezed
          ? _value._medias
          : medias // ignore: cast_nullable_to_non_nullable
              as List<Media>?,
      commenter: commenter == freezed
          ? _value.commenter
          : commenter // ignore: cast_nullable_to_non_nullable
              as User?,
      canDelete: canDelete == freezed
          ? _value.canDelete
          : canDelete // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment extends _Comment {
  _$_Comment(
      {@HiveField(0) required this.id,
      @HiveField(1) this.text,
      @HiveField(2) this.reportId,
      @HiveField(3) this.commentedByUserId,
      @HiveField(4) this.isPublic,
      @HiveField(5) this.createdAt,
      @HiveField(6) final List<Media>? medias,
      @HiveField(7) this.commenter,
      @HiveField(8) this.canDelete})
      : _medias = medias,
        super._();

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String? text;
  @override
  @HiveField(2)
  final int? reportId;
  @override
  @HiveField(3)
  final int? commentedByUserId;
  @override
  @HiveField(4)
  final bool? isPublic;
  @override
  @HiveField(5)
  final DateTime? createdAt;
  final List<Media>? _medias;
  @override
  @HiveField(6)
  List<Media>? get medias {
    final value = _medias;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @HiveField(7)
  final User? commenter;
  @override
  @HiveField(8)
  final bool? canDelete;

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, reportId: $reportId, commentedByUserId: $commentedByUserId, isPublic: $isPublic, createdAt: $createdAt, medias: $medias, commenter: $commenter, canDelete: $canDelete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality().equals(other.reportId, reportId) &&
            const DeepCollectionEquality()
                .equals(other.commentedByUserId, commentedByUserId) &&
            const DeepCollectionEquality().equals(other.isPublic, isPublic) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other._medias, _medias) &&
            const DeepCollectionEquality().equals(other.commenter, commenter) &&
            const DeepCollectionEquality().equals(other.canDelete, canDelete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(reportId),
      const DeepCollectionEquality().hash(commentedByUserId),
      const DeepCollectionEquality().hash(isPublic),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_medias),
      const DeepCollectionEquality().hash(commenter),
      const DeepCollectionEquality().hash(canDelete));

  @JsonKey(ignore: true)
  @override
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment extends Comment {
  factory _Comment(
      {@HiveField(0) required final int id,
      @HiveField(1) final String? text,
      @HiveField(2) final int? reportId,
      @HiveField(3) final int? commentedByUserId,
      @HiveField(4) final bool? isPublic,
      @HiveField(5) final DateTime? createdAt,
      @HiveField(6) final List<Media>? medias,
      @HiveField(7) final User? commenter,
      @HiveField(8) final bool? canDelete}) = _$_Comment;
  _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String? get text;
  @override
  @HiveField(2)
  int? get reportId;
  @override
  @HiveField(3)
  int? get commentedByUserId;
  @override
  @HiveField(4)
  bool? get isPublic;
  @override
  @HiveField(5)
  DateTime? get createdAt;
  @override
  @HiveField(6)
  List<Media>? get medias;
  @override
  @HiveField(7)
  User? get commenter;
  @override
  @HiveField(8)
  bool? get canDelete;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
