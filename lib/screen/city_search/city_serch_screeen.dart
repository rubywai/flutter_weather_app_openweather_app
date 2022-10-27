import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/search_bloc/search_city_bloc.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/screen/city_search/widget/city_list_widget.dart';
import 'package:untitled/screen/city_search/widget/search_field_widget.dart';

class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({Key? key}) : super(key: key);

  @override
  State<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SearchCityBloc _searchCityBloc = SearchCityBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchCityBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather Application'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            SearchFieldWidget(searchController: _searchController, searchCityBloc: _searchCityBloc),
            BlocBuilder<SearchCityBloc, SearchCityState>(
                builder: (context, state) {
              if (state is SearchCityLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchCityFailed) {
                return Text(state.errorMessage);
              } else if (state is SearchCitySuccess) {
                List<CitySearchResult> cities = state.cities;
                if(cities.isEmpty){
                  return const Center(child: Text('Empty Result'),);
                }
                return CountryListWidget(cities: cities);
              }
              return const SizedBox();
            })
          ],
        ),
      ),
    );
  }
}




