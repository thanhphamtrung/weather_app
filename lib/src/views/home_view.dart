import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/di.dart';
import 'package:weather_app/src/widgets/weather_card.dart';

import '../providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    sl<WeatherProvider>().fetchWeather(context, 'London');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(builder: (_, instance, child) {
      return Scaffold(
          body: instance.isLoading
              ? const Center(child: CircularProgressIndicator())
              : WeatherCard(weather: instance.weather));
    });
  }
}
