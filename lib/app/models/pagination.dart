import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moderator_app/app/utils/index.dart';

part 'pagination.freezed.dart';

part 'pagination.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class Pagination with _$Pagination {
  const Pagination._(); // This allow to add custom methods and getters

  static putJsonData(Iterable listItem) {
    return List<Map<String, dynamic>>.from(listItem);
  }

  static List<Map<String, dynamic>> getJsonData(List<Map<String, dynamic>> list) {
    return list;
  }

  const factory Pagination({
    required int currentPage,
    required int? from,
    required int? to,
    required int total,
    required int lastPage,
    required int perPage,
    @JsonKey(name: 'data', fromJson: Pagination.putJsonData, toJson: Pagination.getJsonData) required List<Map<String, dynamic>> rawData,
  }) = _Pagination;

  T _parser<T>(Map<String, dynamic> data) {
    return deserialize<T>(data);
  }

  int get totalPages => lastPage;

  bool get hasMorePage => currentPage < lastPage;

  List<T> getData<T>() => List<T>.generate(rawData.length, (index) => _parser<T>(rawData[index]));

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
