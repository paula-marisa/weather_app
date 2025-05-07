import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../models/forecast.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherService _service = WeatherService();

  Weather? _weather;
  List<Forecast> _forecasts = [];
  bool _loading = false;
  String? _error;

  Weather? get weather => _weather;
  List<Forecast> get forecasts => _forecasts;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadWeather(String city) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await _service.fetchWeather(city);
      _forecasts = await _service.fetchForecast(city);
    } catch (e) {
      _error = e.toString();
      _weather = null;
      _forecasts = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}