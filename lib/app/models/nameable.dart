import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/utils/helpers.dart';

part 'nameable.freezed.dart';
part 'nameable.g.dart';

@HiveType(typeId: 10)
@Freezed(makeCollectionsUnmodifiable: true)
class Nameable with _$Nameable {
  const Nameable._();

  factory Nameable({
    @HiveField(0) String? nameEn,
    @HiveField(1) String? nameKm,
  }) = _Nameable;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn ?? '-';
    }
    return nameEn ?? '-';
  }

  factory Nameable.fromJson(Map<String, dynamic> json) => _$NameableFromJson(json);
}
