import 'package:flutter/material.dart';
import 'package:untitled/screen/city_search/city_serch_screeen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CitySearchScreen(),
    );
  }
}
