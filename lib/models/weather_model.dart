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

  factory WeatherModel.fromjson(
      dynamic data) {
    var jsondata = data['forecast']
        ['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']
            ['localtime'],
        avgtemp: jsondata['avgtemp_c'],
        maxtemp: jsondata['maxtemp_c'],
        mintemp: jsondata['mintemp_c'],
        condition: jsondata['condition']
            ['text']);
  }

  String getImage() {
    if (condition == 'Clear' ||
        condition == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (condition == 'Sleet' ||
        condition == 'Snow' ||
        condition == 'Hail') {
      return 'assets/images/snow.png';
    } else if (condition ==
        'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (condition ==
            'Light Rain' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (condition ==
            'Thunderstorm' ||
        condition == 'Storm') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
