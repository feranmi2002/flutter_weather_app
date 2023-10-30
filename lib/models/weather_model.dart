

import 'dart:ffi';

class WeatherModel{
  String main;
  String description;
  String temperature;
  String cityName;
  Long sunriseTime;
  Long sunsetTime;

  WeatherModel({required this.main,
  required this.description,
  required this.temperature,
  required this.cityName,
  required this.sunriseTime,
  required this.sunsetTime});

}