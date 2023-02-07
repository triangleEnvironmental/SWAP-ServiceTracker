import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:moderator_app/app/utils/helpers.dart';

part 'html_page.freezed.dart';
part 'html_page.g.dart';

@HiveType(typeId: 20)
@Freezed(makeCollectionsUnmodifiable: true)
class HtmlPage with _$HtmlPage {
  const HtmlPage._();

  factory HtmlPage({
    @HiveField(0) required int id,
    @HiveField(1) required String key,
    @HiveField(2) required String contentEn,
    @HiveField(3) required String? contentKm,
  }) = _HtmlPage;

  String get content {
    if (currentLocale.languageCode == 'km') {
      return contentKm ?? contentEn;
    }
    return contentEn;
  }

  factory HtmlPage.fromJson(Map<String, dynamic> json) => _$HtmlPageFromJson(json);
}
