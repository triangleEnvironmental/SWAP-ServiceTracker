import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/models/index.dart';

part 'notification_preset.freezed.dart';

part 'notification_preset.g.dart';

@HiveType(typeId: 22)
@Freezed(makeCollectionsUnmodifiable: true)
class NotificationPreset with _$NotificationPreset {
  const NotificationPreset._();

  factory NotificationPreset({
    @HiveField(0) required int id,
    @HiveField(1) String? title,
    @HiveField(2) String? description,
    @HiveField(3) int? institutionId,
    @HiveField(4) Institution? institution,
  }) = _NotificationPreset;

  factory NotificationPreset.fromJson(Map<String, dynamic> json) => _$NotificationPresetFromJson(json);
}