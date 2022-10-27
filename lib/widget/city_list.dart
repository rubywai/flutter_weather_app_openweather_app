import 'package:flutter/material.dart';
import 'package:untitled/data/model/city_search_model.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({
    Key? key,
    required this.cities,
  }) : super(key: key);

  final List<CitySearchResult> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context,index){
          CitySearchResult city = cities[index];
          return ListTile(
            title: Text(city.name ?? ''),
            subtitle: Text(city.country ?? ''),
          );
        });
  }
}