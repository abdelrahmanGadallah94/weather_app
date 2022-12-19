import 'dart:convert';

import '../../modal/weather_modal.dart';
import 'package:http/http.dart' as http;

import '../../views/settings/app_string.dart';

class WeatherServices {
  Future<WeatherModal?> getWeather({required String cityName}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?key=${AppString.apiKey}&q=$cityName&days=7"));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        WeatherModal weatherData = WeatherModal.fromJson(data);
        print(weatherData.date);
        return weatherData;
      } else {
        throw Exception("${response.body}");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
