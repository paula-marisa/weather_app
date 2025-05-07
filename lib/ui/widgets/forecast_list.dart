import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/forecast.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast> forecasts;
  const ForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    final dayFormat = DateFormat.E(Localizations.localeOf(context).languageCode);

    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: forecasts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final f = forecasts[i];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(dayFormat.format(f.date), style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 6),
                  Image.network('https://openweathermap.org/img/wn/${f.icon}@2x.png'),
                  const SizedBox(height: 6),
                  Text('${f.maxTemp.toStringAsFixed(0)}° / ${f.minTemp.toStringAsFixed(0)}°'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}