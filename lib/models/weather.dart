class Weather {
  final String description;
  final double temp;
  final String icon;

  Weather({
    required this.description,
    required this.temp,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'] as String,
      temp: (json['main']['temp'] as num).toDouble(),
      icon: json['weather'][0]['icon'] as String,
    );
  }
}
