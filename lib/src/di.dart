import 'package:get_it/get_it.dart';
import 'package:weather_app/src/providers/weather_provider.dart';
import 'package:weather_app/src/services/api_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl.registerLazySingleton<ApiRepo>(
  //   () => ApiRepo(
  //     client: sl(),
  //   ),
  // );

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton(() => WeatherProvider());
  sl.registerLazySingleton(() => ApiService());
}
