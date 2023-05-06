import 'package:flutter/material.dart';

import '../di.dart';
import '../models/weather.dart';
import '../services/api_service.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  final String _abc = 'abc';

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  String get abc => _abc;

  Future<void> fetchWeather(BuildContext context, String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      final weatherData = await sl<ApiService>().getCurrentWeather(city);
      _weather = weatherData;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
