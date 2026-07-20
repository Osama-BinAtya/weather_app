import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double avgtemp;
  double maxtemp;
  double mintemp;
  String condition;

  WeatherModel(
      {required this.date,
      required this.avgtemp,
      required this.maxtemp,
      required this.mintemp,
      required this.condition});

  factory WeatherModel.fromjson(dynamic data) {
    var current = data['current'];
    return WeatherModel(
      date: data['location']['localtime'],
      avgtemp: current['temp_c'],
      maxtemp: current['temp_c'],
      mintemp: current['temp_c'],
      condition: current['condition']['text'],
    );
  }

  String getImage() {
    if (condition == 'Clear' || condition == 'Sunny') {
      return 'assets/images/clear.png';
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return 'assets/images/snow.png';
    } else if (condition == 'Partly cloudy' || condition == 'Overcast') {
      return 'assets/images/cloudy.png';
    } else if (condition == 'Rain' || condition == 'Haze') {
      return 'assets/images/rainy.png';
    } else if (condition == 'Thunderstorm' ||
        condition == 'Light rain shower') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/cloudy.png';
    }
  }

  MaterialColor getThemeColor() {
    if (condition == 'Clear' || condition == 'Sunny') {
      return Colors.orange;
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return Colors.blue;
    } else if (condition == 'Partly cloudy' || condition == 'Overcast') {
      return Colors.blueGrey;
    } else if (condition == 'Rain' || condition == 'Haze') {
      return Colors.cyan;
    } else if (condition == 'Thunderstorm' ||
        condition == 'Light rain shower') {
      return Colors.lightGreen;
    } else {
      return Colors.blueGrey;
    }
  }
}
