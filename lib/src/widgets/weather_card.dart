import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.weather}) : super(key: key);
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.3),
        image: const DecorationImage(
            image: AssetImage('assets/illustrators/sunny_bg_1.png'),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather?.city ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.location_on)
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  '${weather?.temperature?.toStringAsFixed(0) ?? 'N/A'}°C',
                  style: const TextStyle(
                    fontSize: 75,
                  ),
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${weather?.temperature?.toStringAsFixed(0) ?? 'N/A'}°C',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 25,
                      width: 0.5,
                    ),
                    Text(
                      'Humidity: ${weather?.humidity?.toStringAsFixed(0) ?? 'N/A'}%',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 25,
                      width: 0.5,
                    ),
                    Text(
                      'Wind: ${weather?.windSpeed?.toStringAsFixed(0) ?? 'N/A'} km/h',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
