import 'package:flutter/material.dart';
import 'package:weather_app/src/di.dart';

import 'src/weather_app.dart';

Future<void> main() async {
  await init();
  runApp(const WeatherApp());
}
