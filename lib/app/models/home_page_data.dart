import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'index.dart';

part 'home_page_data.freezed.dart';

part 'home_page_data.g.dart';

@HiveType(typeId: 17)
@Freezed(makeCollectionsUnmodifiable: false)
class HomePageData with _$HomePageData {
  const HomePageData._();

  factory HomePageData({
    @HiveField(0) required List<StatusCounting> statusCountings,
    @HiveField(1) required List<Report> recentReports,
  }) = _HomePageData;

  factory HomePageData.fromJson(Map<String, dynamic> json) => _$HomePageDataFromJson(json);
}