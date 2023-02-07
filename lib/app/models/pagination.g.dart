// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pagination _$$_PaginationFromJson(Map json) => _$_Pagination(
      currentPage: json['current_page'] as int,
      from: json['from'] as int?,
      to: json['to'] as int?,
      total: json['total'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      rawData: Pagination.putJsonData(json['data'] as List),
    );

Map<String, dynamic> _$$_PaginationToJson(_$_Pagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'to': instance.to,
      'total': instance.total,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'data': Pagination.getJsonData(instance.rawData),
    };
