import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as lp;

import 'weather_provider.dart';

class LocationProvider with ChangeNotifier {
  String? _city = '';
  bool? _isLocationGranted;
  final lp.Location _location = lp.Location.instance;
  final WeatherProvider weatherProvider;

  LocationProvider(this.weatherProvider);

  Future<lp.PermissionStatus> checkPermissions() async {
    return await _location.hasPermission();
  }

  Future<void> requestPermission() async {
    _isLocationGranted =
        await _location.requestPermission() == lp.PermissionStatus.granted;
  }

  String? get city => _city;
  bool? get isLocationGranted => _isLocationGranted;

  // Define a method that updates the city name based on the coordinates
  void updateCity(double latitude, double longitude) async {
    // Use the geocoding plugin to get the placemarks from the coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    // Get the first placemark and extract the city name
    Placemark placemark = placemarks.first;
    String? city = placemark.locality;
    // Update the state and notify the listeners
    _city = city;
    weatherProvider.fetchWeather(_city ?? '');
    notifyListeners();
  }

  // Define a method that gets the current user's location and updates the city name
  Future getCurrentLocation() async {
    // Use the geolocator plugin to get the current position of the device
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // Get the latitude and longitude from the position
    double latitude = position.latitude;
    double longitude = position.longitude;

    updateCity(latitude, longitude);
  }
}
