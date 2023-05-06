class Search {
  final String city;
  final String temp;

  Search(this.city, this.temp);

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      json['name'], // The city name
      json['main']['temp'].toString(), // The temperature
    );
  }
}
