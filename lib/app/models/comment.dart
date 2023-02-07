import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@HiveType(typeId: 7)
@Freezed(makeCollectionsUnmodifiable: true)
class Comment with _$Comment {
  const Comment._();

  factory Comment({
    @HiveField(0) required int id,
    @HiveField(1) String? text,
    @HiveField(2) int? reportId,
    @HiveField(3) int? commentedByUserId,
    @HiveField(4) bool? isPublic,
    @HiveField(5) DateTime? createdAt,
    @HiveField(6) List<Media>? medias,
    @HiveField(7) User? commenter,
    @HiveField(8) bool? canDelete,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}