import 'dart:convert';

import 'package:flutter_weather_app/api/LoadStates.dart';
import 'package:flutter_weather_app/api/Result.dart';
import 'package:flutter_weather_app/location/location.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

const API_KEY = "68b9f32f0b0e973bdcc72de00190236d";
const LOCATION_WEATHER_BASE_URL = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=";


class WeatherApi {


  String locationWeatherUrl({required double latitude, required longitude}) {
    return "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY";
  }

  Future<Result> getWeatherUserLocation() async {
    Result result = Result(loadState: LoadStates.LOADING, data: []);
    try {
      var position = await Location().getCurrentPosition();
      if (position != null) {
        var response = await http.get(Uri.parse(locationWeatherUrl(
            latitude: position.latitude, longitude: position.longitude)));
        var jsonData = jsonDecode(response.body);
        result.data = parseJsonData(jsonData);
        result.loadState = LoadStates.SUCCESS;
      }
    } on Exception catch (e) {
      result.loadState = LoadStates.ERROR;
    }
    return result;
  }

  List<WeatherModel> parseJsonData(dynamic jsonBody) {
    var locationWeather = <WeatherModel>[];
    var weather = jsonBody["weather"].first();
    var main = jsonBody["main"];
    var sys = jsonBody["sys"];
    locationWeather.add(WeatherModel(main: weather["main"], description: weather["description"], temperature: main["temp"], cityName:jsonBody["name"] , sunriseTime: sys["sunrise"], sunsetTime: sys["sunset"]));
    return locationWeather;
  }
}