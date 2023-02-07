import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/utils/helpers.dart';

part 'role.freezed.dart';

part 'role.g.dart';

@HiveType(typeId: 16)
@Freezed(makeCollectionsUnmodifiable: true)
class Role with _$Role {
  const Role._();

  factory Role({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
    @HiveField(3) bool? isUnderInstitution,
  }) = _Role;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
