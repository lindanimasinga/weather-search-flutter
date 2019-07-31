import 'dart:convert';

import 'package:flutter_mvc_weather_app/src/model/city.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static const weatherApiBaseUrl = "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=44c4acdf150c75c309d3f45dba63a70b&";
  
  static Stream<City> fetchCurrentWeather(String cityName) {
    final responseStream = http.get('${weatherApiBaseUrl}q=$cityName').asStream();
    return responseStream.map((data) => City.fromJson(json.decode(data.body)));
  }
}
