import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/providers/weather_provider.dart';

import 'di.dart';
import 'views/home_view.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<WeatherProvider>()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
