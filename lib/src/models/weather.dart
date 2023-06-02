class Weather {
  final String? city;
  final String? description;
  final double? temperature;
  final double? feelsLike;
  final double? minTemperature;
  final double? maxTemperature;
  final int? humidity;
  final double? windSpeed;
  final int? cloudiness;
  final int? sunrise;
  final int? sunset;
  final DateTime? dateTime;

  Weather({
    this.city,
    this.description,
    this.temperature,
    this.feelsLike,
    this.minTemperature,
    this.maxTemperature,
    this.humidity,
    this.windSpeed,
    this.cloudiness,
    this.sunrise,
    this.sunset,
    this.dateTime,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];
    final wind = json['wind'];
    final clouds = json['clouds'];
    final sys = json['sys'];
    final dt = json['dt'] * 1000;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dt.toInt());

    return Weather(
      city: json['name'],
      description: weather['description'],
      temperature: main['temp']?.toDouble(),
      feelsLike: main['feels_like']?.toDouble(),
      minTemperature: main['temp_min']?.toDouble(),
      maxTemperature: main['temp_max']?.toDouble(),
      humidity: main['humidity'],
      windSpeed: wind['speed']?.toDouble(),
      cloudiness: clouds['all'],
      sunrise: sys['sunrise']! * 1000,
      sunset: sys['sunset']! * 1000,
      dateTime: dateTime,
    );
  }
  Weather? copyWith({
    String? city,
    String? description,
    double? temperature,
    double? feelsLike,
    double? minTemperature,
    double? maxTemperature,
    int? humidity,
    double? windSpeed,
    int? cloudiness,
    int? sunrise,
    int? sunset,
    DateTime? dateTime,
  }) {
    return Weather(
      city: city ?? this.city,
      description: description ?? this.description,
      temperature: temperature ?? this.temperature,
      feelsLike: feelsLike ?? this.feelsLike,
      minTemperature: minTemperature ?? this.minTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      cloudiness: cloudiness ?? this.cloudiness,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
