import 'package:flutter/material.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/screen/weather_detail/weather_detail_screen.dart';

class CountryListWidget extends StatelessWidget {
  const CountryListWidget({
    Key? key,
    required this.cities,
  }) : super(key: key);

  final List<CitySearchResult> cities;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            CitySearchResult city = cities[index];
            return ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => WeatherDetailScreen(
                      lat: city.lat ?? 0,
                      lon: city.lon ?? 0,
                    )));
              },
              title: Text(city.name ?? ''),
              subtitle: Text(city.country ?? ''),
            );
          }),
    );
  }
}