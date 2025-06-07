import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';
import '../models/forecast.dart';

class WeatherService {
  final String _apiKey = '25ba51264d1b1f03fcf0f9fb70ce00f7';

  Future<Weather> fetchWeather(String city, String lang) async {
    final query = Uri.encodeComponent(city);
    final uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$query&appid=$_apiKey&units=metric&lang=$lang',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }

  Future<List<Forecast>> fetchForecast(String city, String lang) async {
    final query = Uri.encodeComponent(city);
    final geoUri = Uri.parse(
      'https://api.openweathermap.org/geo/1.0/direct?q=$query&limit=1&appid=$_apiKey',
    );
    final geoRes = await http.get(geoUri);
    final geoJson = (jsonDecode(geoRes.body) as List).first;
    final lat = geoJson['lat'], lon = geoJson['lon'];

    final uri = Uri.parse(
      'https://api.openweathermap.org/data/2.5/onecall?'
          'lat=$lat&lon=$lon&exclude=current,minutely,hourly,alerts'
          '&units=metric&lang=$lang&appid=$_apiKey',
    );
    final res = await http.get(uri);

    final decoded = jsonDecode(res.body) as Map<String, dynamic>;

    final List<dynamic>? dailyData = decoded['daily'] as List<dynamic>?;

    if (dailyData == null) {
      return [];
    }

    final slice = dailyData.length >= 6 ? dailyData.sublist(1, 6) : dailyData;
    return slice
        .map((e) => Forecast.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}