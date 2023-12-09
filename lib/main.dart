import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const textTheme_ = TextTheme(
    titleSmall: TextStyle(fontSize: 14),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.light().copyWith(textTheme: textTheme_),
      darkTheme: ThemeData.dark().copyWith(textTheme: textTheme_),
      home: const LocationScreen(),
    );
  }
}
