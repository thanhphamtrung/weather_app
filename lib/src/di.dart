import 'package:get_it/get_it.dart';

import 'providers/location_provider.dart';
import 'providers/search_provider.dart';
import 'providers/weather_provider.dart';
import 'services/weather_api.dart';

final sl = GetIt.instance;
final WeatherProvider _weatherProvider = WeatherProvider();

Future<void> init() async {
  // sl.registerLazySingleton<ApiRepo>(
  //   () => ApiRepo(
  //     client: sl(),
  //   ),
  // );

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => _weatherProvider);
  sl.registerLazySingleton(() => SearchProvider());
  sl.registerLazySingleton(() => LocationProvider(_weatherProvider));
  sl.registerLazySingleton(() => WeatherApi());
}
