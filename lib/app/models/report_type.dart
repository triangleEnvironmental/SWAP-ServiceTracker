import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/utils/helpers.dart';

part 'report_type.freezed.dart';
part 'report_type.g.dart';

@HiveType(typeId: 5)
@Freezed(makeCollectionsUnmodifiable: true)
class ReportType with _$ReportType {
  const ReportType._();

  factory ReportType({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
    @HiveField(3) int? sectorId,
    @HiveField(4) bool? isPrivate,
  }) = _ReportType;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  factory ReportType.fromJson(Map<String, dynamic> json) => _$ReportTypeFromJson(json);
}
