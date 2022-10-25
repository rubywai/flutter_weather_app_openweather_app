import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/search_weather/search_weather_bloc.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/ui/current_weather/current_weather_screen.dart';

class SearchWeatherScreen extends StatefulWidget {
  const SearchWeatherScreen({Key? key}) : super(key: key);

  @override
  State<SearchWeatherScreen> createState() => _SearchWeatherScreenState();
}

class _SearchWeatherScreenState extends State<SearchWeatherScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SearchWeatherBloc _searchWeatherBloc = SearchWeatherBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchWeatherBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Search City'),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        _searchWeatherBloc.add(
                            SearchWeather(_searchController.text));
                      },
                    )
                ),
              ),
            ),
            BlocBuilder<SearchWeatherBloc, SearchWeatherState>(
              builder: (context, state) {
                if(state is SearchWeatherLoading){
                  return const Center(child: CircularProgressIndicator(),);
                }
                else if(state is SearchWeatherSuccess){
                  List<CitySearchResult> cities = state.cities;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: cities.length,
                        itemBuilder: (context,index){
                          CitySearchResult city = cities[index];
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => CurrentWeather(lat: city.lat ?? 0, long: city.lon ?? 0)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                elevation : 0,
                                child: ListTile(
                                  title: Text(city.name ?? ''),
                                  subtitle: Text(city.country ?? ''),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
                else if(state is SearchWeatherFailed){
                  return const Center(child: Text('Something wrong'),);
                }
                return Container();
              },
            ),

          ],
        ),
      ),
    );
  }
}
