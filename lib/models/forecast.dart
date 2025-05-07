class Forecast {
  final DateTime date;
  final String icon;
  final double minTemp;
  final double maxTemp;

  Forecast({
    required this.date,
    required this.icon,
    required this.minTemp,
    required this.maxTemp,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      icon: json['weather'][0]['icon'] as String,
      minTemp: (json['temp']['min'] as num).toDouble(),
      maxTemp: (json['temp']['max'] as num).toDouble(),
    );
  }
}
