import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

import '../providers/weather_provider.dart';
import 'widgets/weather_card.dart';
import 'widgets/forecast_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:
                provider.weather != null
                    ? _backgroundFor(provider.weather!.description)
                    : [Colors.blueGrey.shade300, Colors.blueGrey.shade600],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Campo de busca
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText:
                              'Escrever a cidade a procurar e clicar no botão',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white24,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                      onPressed:
                          () => provider.loadWeather(_controller.text.trim()),
                    ),
                  ],
                ),
              ),

              if (!provider.loading &&
                  provider.weather == null &&
                  provider.error == null) ...[
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.wb_sunny_outlined,
                          size: 64,
                          color: Colors.white70,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Bem-vindo ao Weather App!\n\n'
                          'Digite o nome de uma cidade acima e veja a metereologia em tempo real.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                if (provider.loading)
                  const CircularProgressIndicator(color: Colors.white)
                else if (provider.error != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      provider.error!,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  )
                else if (provider.weather != null) ...[
                  // Animação Lottie
                  SizedBox(
                    height: 200,
                    child: Lottie.asset(
                      'assets/animations/${_lottieFor(provider.weather!.description)}.json',
                      repeat: true,
                    ),
                  ),

                  WeatherCard(weather: provider.weather!),

                  if (provider.forecasts != null)
                    ForecastList(forecasts: provider.forecasts!),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Atualizado em: ${DateFormat.Hm().format(DateTime.now())}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _backgroundFor(String desc) {
    final d = desc.toLowerCase();
    if (d.contains('nuvem') || d.contains('cloud') || d.contains('nuvens')) {
      return [Colors.blueGrey.shade400, Colors.blueGrey.shade800];
    } else if (d.contains('chuva') || d.contains('rain')) {
      return [Colors.indigo.shade600, Colors.blueGrey.shade900];
    } else {
      return [Colors.orange.shade300, Colors.deepOrange.shade700];
    }
  }

  String _lottieFor(String desc) {
    final d = desc.toLowerCase();
    if (d.contains('rain') || d.contains('chuva')) return 'rain';
    if (d.contains('cloud') || d.contains('nuvem') || d.contains('nuvens'))
      return 'cloudy';
    if (d.contains('sunny') || d.contains('sol')) return 'sunny';
    return 'weather';
  }
}
