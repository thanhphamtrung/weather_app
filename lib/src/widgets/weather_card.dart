import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../cores/app_routes.dart';
import '../models/weather.dart';
import '../providers/location_provider.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.weather}) : super(key: key);
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    LocationProvider locationProvider = context.read<LocationProvider>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.3),
        image: (weather?.temperature ?? 0) < 20
            ? const DecorationImage(
                image: AssetImage('assets/illustrators/coldboy_bg_1.png'),
                fit: BoxFit.cover)
            : const DecorationImage(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go(AppRouter.searchScreen);
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () async {
                        PermissionStatus isGranted = await context
                            .read<LocationProvider>()
                            .checkPermissions();
                        if (isGranted != PermissionStatus.granted) {
                          await locationProvider.requestPermission();
                        } else {
                          await locationProvider.getCurrentLocation();
                        }
                      },
                      icon: const Icon(
                        Icons.my_location,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 8)
                  ],
                ),
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
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.white, width: 3, strokeAlign: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    weather?.dateTime != null
                        ? 'Date Time: ${DateFormat('dd/MM/yyyy').format(weather!.dateTime!)}'
                        : 'N/A',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Min Temperature: ${weather?.minTemperature?.toStringAsFixed(0) ?? 'N/A'}°C',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Divider(),
                  Text(
                    'Max Temperature: ${weather?.maxTemperature?.toStringAsFixed(0) ?? 'N/A'}%',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
