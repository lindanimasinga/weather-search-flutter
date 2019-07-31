// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
      json['name'] as String,
      (json['weather'] as List)
          ?.map((e) =>
              e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['main'] == null
          ? null
          : MainData.fromJson(json['main'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'name': instance.name,
      'weather': instance.weather,
      'main': instance.main
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) {
  return MainData(
      (json['temp'] as num)?.toDouble(), (json['humidity'] as num)?.toDouble());
}

Map<String, dynamic> _$MainDataToJson(MainData instance) =>
    <String, dynamic>{'temp': instance.temp, 'humidity': instance.humidity};

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(json['main'] as String, json['description'] as String,
      json['icon'] as String);
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon
    };
