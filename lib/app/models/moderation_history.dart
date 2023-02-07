import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'moderation_history.freezed.dart';

part 'moderation_history.g.dart';

@HiveType(typeId: 9)
@Freezed(makeCollectionsUnmodifiable: true)
class ModerationHistory with _$ModerationHistory {
  const ModerationHistory._();

  factory ModerationHistory({
    @HiveField(0) int? id,
    @HiveField(1) int? fromStatusId,
    @HiveField(2) int? toStatusId,
    @HiveField(3) int? moderatedByUserId,
    @HiveField(4) int? masterNotificationId,
    @HiveField(5) DateTime? createdAt,
    @HiveField(6) ReportStatus? fromStatus,
    @HiveField(7) ReportStatus? toStatus,
    @HiveField(8) User? moderator,
    @HiveField(9) MasterNotification? masterNotification,
    @HiveField(10) Report? report,
  }) = _ModerationHistory;

  factory ModerationHistory.fromJson(Map<String, dynamic> json) => _$ModerationHistoryFromJson(json);
}