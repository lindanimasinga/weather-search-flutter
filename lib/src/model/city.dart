import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  String name;
  List<Weather> weather;
  MainData main;

  City(this.name, this.weather, this.main);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@JsonSerializable()
class MainData {
  double temp;
  double humidity;

  MainData(this.temp, this.humidity);

  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);
}

@JsonSerializable()
class Weather {
  String main;
  String description;
  String icon;

  Weather(this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
