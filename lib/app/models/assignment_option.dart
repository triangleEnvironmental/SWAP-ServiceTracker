import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'assignment_option.freezed.dart';

part 'assignment_option.g.dart';

@HiveType(typeId: 21)
@Freezed(makeCollectionsUnmodifiable: true)
class AssignmentOption with _$AssignmentOption {
  const AssignmentOption._();

  factory AssignmentOption({
    @HiveField(0) required List<User> adminUsers,
    @HiveField(1) required List<Institution> institutions,
  }) = _AssignmentOption;

  factory AssignmentOption.fromJson(Map<String, dynamic> json) => _$AssignmentOptionFromJson(json);
}