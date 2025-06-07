import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/main.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/providers/locale_provider.dart';

void main() {
  testWidgets('App builds and shows search hint', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherProvider()),
          ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ],
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MyApp), findsOneWidget);
  });
}
