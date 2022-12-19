import 'package:flutter/cupertino.dart';

import '../../modal/weather_modal.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherModal ? _weatherData;

  set weatherData (WeatherModal? weather){
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModal? get  weatherData => _weatherData;

  String? cityName;
}