import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:weather_app/src/di.dart';

import 'cores/app_routes.dart';
import 'providers/location_provider.dart';
import 'providers/search_provider.dart';
import 'providers/weather_provider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<WeatherProvider>()),
        ChangeNotifierProvider(create: (_) => sl<SearchProvider>()),
        ChangeNotifierProvider(create: (_) => sl<LocationProvider>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
