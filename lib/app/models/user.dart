import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
@Freezed(makeCollectionsUnmodifiable: true)
class User with _$User {
  const User._();

  factory User({
    @HiveField(0) required int id,
    @JsonKey(name: 'name') @HiveField(1) String? firstName,
    @HiveField(2) String? lastName,
    @HiveField(3) String? fullName,
    @HiveField(4) String? profilePhotoPath,
    @HiveField(5) String? profilePhotoUrl,
    @HiveField(6) String? phoneNumber,
    @HiveField(7) String? address,
    @HiveField(8) Point? location,
    @HiveField(9) Institution? institution,
    @HiveField(10) String? email,
    @HiveField(11) Role? role,
  }) = _User;

  LatLng? get latLng {
    if (location == null) {
      return null;
    }
    return LatLng(location!.latitude, location!.longitude);
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
