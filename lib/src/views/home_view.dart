import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../di.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
