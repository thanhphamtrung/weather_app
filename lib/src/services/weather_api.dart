import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:weather_app/src/models/weather.dart';

import '../models/search.dart';

class WeatherApi {
  static const String apiKey = '2c0548362e5da6d2be4230f63435e112';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String suggestionBaseUrl =
      'https://api.openweathermap.org/geo/1.0/direct';

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

  static Future<List<Search>> getResults(String query) async {
    // Define the API key and the API endpoint

    // Make a GET request to the API endpoint with the query and the API key as parameters
    final response =
        await http.get(Uri.parse('$baseUrl/find?q=$query&appid=$apiKey'));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body);

      // Map the JSON response to a list of SearchResult objects
      final results =
          data['list'].map<Search>((json) => Search.fromJson(json)).toList();

      // Return the list of search results
      return results;
    } else {
      // Handle the error here
      print('Failed to get data from API: ${response.statusCode}');
      // Return an empty list
      return [];
    }
  }

  static Future<List<String>> getSuggestions(String query) async {
    // Make a GET request to the API endpoint with the query and the API key as parameters
    final response = await http
        .get(Uri.parse('$suggestionBaseUrl?q=$query&limit=5&appid=$apiKey'));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = jsonDecode(response.body);

      // Map the JSON response to a list of city names
      List<String> suggestions = [];
      for (var item in data) {
        suggestions.add(item['name']);
      }
      // final suggestions = data.map<String>((json) => json['name']).toList();

      // Return the list of city names
      return suggestions;
    } else {
      // Handle the error here
      print('Failed to get data from API: ${response.statusCode}');
      // Return an empty list
      return [];
    }
  }
}
