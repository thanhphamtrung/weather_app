import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/src/services/weather_api.dart';

import '../models/search.dart';

class SearchProvider extends ChangeNotifier {
  // A list of search results
  List<Search> _results = [];

  // A getter to access the list of search results
  List<Search> get results => _results;

  // A list of search suggestions
  List<String> _suggestions = [];

  // A getter to access the list of search suggestions
  List<String> get suggestions => _suggestions;

  // A method to perform the search logic and update the list of search results
  void search(String query) async {
    // Clear the previous results
    _results.clear();

    // Get the list of search results from the WeatherApi class
    final results = await WeatherApi.getResults(query);

    // Update the list of search results with the results
    _results = results;

    // Notify the listeners that the data has changed
    notifyListeners();
  }

  void getSuggestions(String query) async {
    // Clear the previous suggestions
    _suggestions.clear();

    // Get the list of city names from the SuggestionApi class
    _suggestions = await WeatherApi.getSuggestions(query);

    // Notify the listeners that the data has changed
    notifyListeners();
  }
}
