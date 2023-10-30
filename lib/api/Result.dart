import 'package:flutter_weather_app/api/LoadStates.dart';

class Result {
  LoadStates loadState;
  List<dynamic> data;

  Result({required this.loadState, required this.data});
}
