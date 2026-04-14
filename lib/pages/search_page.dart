import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

// ignore: must_be_immutable
class SearchPage
    extends StatelessWidget {
  SearchPage({Key? key})
      : super(key: key);
  String? cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets
                .symmetric(
                horizontal: 15),
            child: TextField(
              onChanged: (data) {
                cityname = data;
              },
              onSubmitted:
                  (data) async {
                cityname = data;
                WeatherServices
                    services =
                    WeatherServices();
                WeatherModel weather =
                    await services
                         .getweather(
                            cityName:
                                cityname!);
                Provider.of<WeatherProvider>(
                            context,
                            listen: false)
                        .weatherData =
                    weather;
                Provider.of<WeatherProvider>(
                        context,
                        listen: false)
                    .cityname = cityname;
                Navigator.pop(context);
              },
              decoration:
                  const InputDecoration(
                contentPadding:
                    EdgeInsets
                        .symmetric(
                  vertical: 20,
                  horizontal: 30,
                ),
                label: Text(
                  "Search City",
                  style: TextStyle(
                      color:
                          Colors.blue),
                ),
                prefixIcon:
                    Icon(Icons.search),
                border:
                    OutlineInputBorder(),
                focusedBorder:
                    OutlineInputBorder(
                  borderSide:
                      BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                hintText:
                    "Enter City Name..",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
