import 'package:flutter/material.dart';
import 'package:untitled/ui/current_weather/current_weather_screen.dart';
import 'package:untitled/ui/search_seather/search_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SearchWeatherScreen(),
    );
  }
}
