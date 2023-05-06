import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'cores/app_routes.dart';
import 'di.dart';
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
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
