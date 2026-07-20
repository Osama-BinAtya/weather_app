import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<WeatherProvider>(context).weatherData == null
        ? Colors.blue
        : Provider.of<WeatherProvider>(context).weatherData!.getThemeColor();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
        scaffoldBackgroundColor: themeColor,
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: const Homepage(),
    );
  }
}
