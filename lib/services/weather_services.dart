import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'c1c8146f2a7449a8ba7160756251409';
  Future<WeatherModel?> getweather({required String cityname}) async {
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityname&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['error'] != null) {
        print('Weather API error: ${data['error']['message']}');
        return null;
      }

      return WeatherModel.fromjson(data);
    } catch (e) {
      print('WeatherServices error: $e');
      return null;
    }
  }
}
