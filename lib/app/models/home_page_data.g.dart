// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomePageDataAdapter extends TypeAdapter<HomePageData> {
  @override
  final int typeId = 17;

  @override
  HomePageData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomePageData(
      statusCountings: (fields[0] as List).cast<StatusCounting>(),
      recentReports: (fields[1] as List).cast<Report>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomePageData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.statusCountings)
      ..writeByte(1)
      ..write(obj.recentReports);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomePageDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomePageData _$$_HomePageDataFromJson(Map json) => _$_HomePageData(
      statusCountings: (json['status_countings'] as List<dynamic>)
          .map((e) =>
              StatusCounting.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      recentReports: (json['recent_reports'] as List<dynamic>)
          .map((e) => Report.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_HomePageDataToJson(_$_HomePageData instance) =>
    <String, dynamic>{
      'status_countings':
          instance.statusCountings.map((e) => e.toJson()).toList(),
      'recent_reports': instance.recentReports.map((e) => e.toJson()).toList(),
    };
