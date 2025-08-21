class Weather {
  final double temp;
  final int humidity;
  final String description;
  final String cityName;
  final String icon;

  Weather({
    required this.temp,
    required this.humidity,
    required this.description,
    required this.cityName,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      cityName: json['name'],
      icon: json['weather'][0]['icon'],
    );
  }
}