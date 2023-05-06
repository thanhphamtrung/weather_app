import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    context.read<WeatherProvider>().fetchWeather(
        context.read<WeatherProvider>().weather?.city ?? 'London');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<WeatherProvider>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : WeatherCard(weather: context.read<WeatherProvider>().weather));
  }
}
