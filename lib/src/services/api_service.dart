import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/src/models/weather.dart';

class ApiService {
  static const String apiKey = '2c0548362e5da6d2be4230f63435e112';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> getCurrentWeather(String city) async {
    final url = '$baseUrl/weather?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<dynamic> getFiveDayForecast(String city) async {
    final url = '$baseUrl/forecast?q=$city&appid=$apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
