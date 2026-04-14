import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider
    extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityname;
  set weatherData(
      WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData =>
      _weatherData;
}
