import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'master_notification.freezed.dart';

part 'master_notification.g.dart';

@HiveType(typeId: 19)
@Freezed(makeCollectionsUnmodifiable: true)
class MasterNotification with _$MasterNotification {
  const MasterNotification._();

  factory MasterNotification({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) String? description,
    @HiveField(3) String? notificationableType,
    @HiveField(4) int? notificationableId,
    @HiveField(5) User? creator,
    @HiveField(6) Institution? institution,
  }) = _MasterNotification;

  factory MasterNotification.fromJson(Map<String, dynamic> json) => _$MasterNotificationFromJson(json);
}