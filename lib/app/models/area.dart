import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/utils/helpers.dart';

part 'area.freezed.dart';

part 'area.g.dart';

@HiveType(typeId: 13)
@Freezed(makeCollectionsUnmodifiable: true)
class Area with _$Area {
  const Area._();

  factory Area({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
  }) = _Area;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  @override
  bool operator ==(Object other) => other is Area && other.id == id;

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
}
