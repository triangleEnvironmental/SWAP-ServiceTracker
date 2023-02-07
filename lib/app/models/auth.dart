import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/models/user.dart';

part 'auth.freezed.dart';

part 'auth.g.dart';

@HiveType(typeId: 0)
@Freezed(makeCollectionsUnmodifiable: true)
class Auth with _$Auth {
  const Auth._();

  factory Auth({
    @HiveField(0) required String accessToken,
    @HiveField(1) required String tokenType,
    @HiveField(2) required User user,
  }) = _Auth;

  String get authorization => "$tokenType $accessToken";

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
