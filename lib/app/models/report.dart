import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'report.freezed.dart';

part 'report.g.dart';

@HiveType(typeId: 14)
@Freezed(makeCollectionsUnmodifiable: true)
class Report with _$Report {
  const Report._();

  factory Report({
    @HiveField(0) required int id,
    @HiveField(1) String? description,
    @HiveField(2) Point? location,
    @HiveField(3) DateTime? createdAt,
    @HiveField(4) DateTime? updatedAt,
    @HiveField(5) int? sectorId,
    @HiveField(6) Sector? sector,
    @HiveField(7) int? reportTypeId,
    @HiveField(8) ReportType? reportType,
    @HiveField(9) int? reportedByUserId,
    @HiveField(10) User? reporter,
    @HiveField(11) int? reportStatusId,
    @HiveField(12) ReportStatus? status,
    @HiveField(13) List<Media>? medias,
    @HiveField(14) List<ModerationHistory>? moderationHistories,
    @HiveField(15) Area? province,
    @HiveField(16) bool? canDelete,
    @HiveField(17) bool? canModerate,
    @HiveField(18) bool? canAssign,
    @HiveField(19) bool? canComment,
    @HiveField(20) User? assignee,
    @HiveField(21) User? assigner,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}