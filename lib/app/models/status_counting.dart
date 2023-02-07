import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/models/index.dart';

part 'status_counting.freezed.dart';
part 'status_counting.g.dart';

@HiveType(typeId: 18)
@Freezed(makeCollectionsUnmodifiable: true)
class StatusCounting with _$StatusCounting {
  const StatusCounting._();

  factory StatusCounting({
    @HiveField(0) required int count,
    @HiveField(1) required ReportStatus status,
  }) = _StatusCounting;

  factory StatusCounting.fromJson(Map<String, dynamic> json) => _$StatusCountingFromJson(json);
}