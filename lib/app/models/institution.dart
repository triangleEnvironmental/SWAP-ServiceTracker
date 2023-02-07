import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';

import 'index.dart';

part 'institution.freezed.dart';
part 'institution.g.dart';

@HiveType(typeId: 3)
@Freezed(makeCollectionsUnmodifiable: true)
class Institution with _$Institution {
  const Institution._();

  factory Institution({
    @HiveField(0) required int id,
    @HiveField(1) required String nameEn,
    @HiveField(2) String? nameKm,
    @HiveField(3) String? logoPath,
    @HiveField(4) String? logoUrl,
    @HiveField(5) List<Sector>? sectors,
    @HiveField(6) bool? isMunicipality,
    @HiveField(7) bool? isServiceProvider,
    @HiveField(8) List<User>? users,
  }) = _Institution;

  String get name {
    if (currentLocale.languageCode == 'km') {
      return nameKm ?? nameEn;
    }
    return nameEn;
  }

  IconData get icon {
    if (isMunicipality == true) {
      return AppIcons.municipality;
    }
    return AppIcons.serviceProvider;
  }

  Widget get logo {
    return UserAvatar(
      logoUrl,
      defaultAsset: AppStrings.serviceProviderPlaceholder,
    );
  }

  factory Institution.fromJson(Map<String, dynamic> json) => _$InstitutionFromJson(json);
}
