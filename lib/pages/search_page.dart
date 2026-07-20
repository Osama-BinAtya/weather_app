import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Search City",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              style: const TextStyle(color: Colors.black87, fontSize: 16),
              cursorColor: Colors.black87,
              onChanged: (data) => cityname = data,
              onSubmitted: (data) async {
                final trimmed = data.trim();
                if (trimmed.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a city name'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                cityname = trimmed;
                WeatherServices services = WeatherServices();
                WeatherModel? weather =
                    await services.getweather(cityname: cityname!);
                if (weather == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('City not found or invalid input'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityname =
                    cityname;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                labelStyle: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black54),
                  onPressed: () async {
                    final trimmed = cityname?.trim();
                    if (trimmed == null || trimmed.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a city name'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    cityname = trimmed;
                    WeatherServices services = WeatherServices();
                    WeatherModel? weather =
                        await services.getweather(cityname: cityname!);
                    if (weather == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('City not found or invalid input'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityname = cityname;
                    Navigator.pop(context);
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                ),
                hintText: 'Enter City Name..',
                hintStyle: const TextStyle(color: Colors.black38),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
