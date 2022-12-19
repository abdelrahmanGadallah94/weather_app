import 'package:flutter/material.dart';

class WeatherModal {
  final DateTime date;
  final String icon;
  final num temperature;
  final num minTemperature;
  final num maxTemperature;
  final String stateOfWeather;

  WeatherModal({
    required this.date,
    required this.icon,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.stateOfWeather,
  });

  factory WeatherModal.fromJson(dynamic jsonData) {
    var data = jsonData["forecast"]["forecastday"][0];
    return WeatherModal(
        date: DateTime.parse(DateTime.now().toString()),
        icon: data["day"]["condition"]["icon"],
        temperature: data["day"]["avgtemp_c"],
        minTemperature: data["day"]["mintemp_c"],
        maxTemperature: data["day"]["maxtemp_c"],
        stateOfWeather: data["day"]["condition"]["text"]);
  }

  MaterialColor getThemeColor(){
    if(stateOfWeather == "Sunny" || stateOfWeather == "Light drizzle"){
      return Colors.orange;
    }else if(stateOfWeather == "Moderate rain" || stateOfWeather == "Light rain"){
      return Colors.blueGrey;
    }else if(stateOfWeather == "Overcast" || stateOfWeather == "Patchy rain possible"){
      return Colors.green;
    }
    else{
      return Colors.blue;
    }
  }
}
