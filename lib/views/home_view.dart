import 'package:flutter/material.dart';
import 'package:flutter_weather_app/api/weather_api.dart';
import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:flutter_weather_app/views/error_view.dart';

import '../api/LoadStates.dart';
import '../api/Result.dart';
import '../util/util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Result result = Result(loadState: LoadStates.LOADING, data: []);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: conditionalWidget(() => {}, result.loadState, result.data.firstOrNull!!));
  }

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  void getLocationWeather() async {
    var weatherApiResult = await WeatherApi().getWeatherUserLocation();
    setState(() {
      result = weatherApiResult;
    });
  }
}

Widget conditionalWidget(Function()? onErrorTapped, LoadStates loadState, WeatherModel weather) {
  switch (loadState) {
    case LoadStates.LOADING:
      return Center(
        child: Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      );

    case LoadStates.SUCCESS:
      return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.location_on_outlined),
              Text(
                weather.cityName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const Icon(Icons.search_outlined)
            ],
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(chooseWeatherIcon(weather.main)),
                fit: BoxFit.fill,
                height: 200,
              ),
              Text(
                weather.temperature,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                weather.description,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(Util().date())
            ],
          )
        ],
      );
    case LoadStates.ERROR:
      return ErrorView(onErrorTapped: onErrorTapped);
  }
}

String chooseWeatherIcon(String weather_description){
  String iconLocation = "";
  if(weather_description.contains("thunderstorm")){
   iconLocation = "assets/thunder.png";
  }
  else if(weather_description.contains("rain")){
    iconLocation = "assets/rain-fall.png";
  }
  else if(weather_description.contains("snow")){
    iconLocation = "assets/snow.png";
  }
  else if(weather_description.contains("fog")){
    iconLocation = "assets/fog.png";
  }
  else if(weather_description.contains("cloud")){
    iconLocation = "assets/cloud.png";
  }
  else if(weather_description.contains("drizzle")){
    iconLocation = "assets/rain.png";
  }
  else if(weather_description.contains("clear")){
    iconLocation = "assets/clear_day.png";
  }
  else if(weather_description.contains("mist")){
    iconLocation = "assets/humidity.png";
  }
  else if(weather_description.contains("sleet")){
    iconLocation = "assets/snow.png";
  }else{
    iconLocation = "assets/clear_day.png";
  }
  return iconLocation;
}
