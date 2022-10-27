import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/search_bloc/search_city_bloc.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/widget/city_list.dart';
import 'package:untitled/widget/search_field.dart';

class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({Key? key}) : super(key: key);

  @override
  State<SearchCityScreen> createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SearchCityBloc _searchCityBloc = SearchCityBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchCityBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            SearchFieldWidget(searchController: _searchController, searchCityBloc: _searchCityBloc),
            BlocBuilder<SearchCityBloc, SearchCityState>(
              builder: (context, state) {
                if(state is SearchCityLoading){
                  return const Center(child:  CircularProgressIndicator());
                }
                else if(state is SearchCityFailed){
                  return Center(child: Text(state.errorMessage),);
                }
                else if(state is SearchCitySuccess){
                  List<CitySearchResult> cities = state.cities;
                  return Expanded(
                    child: CityListWidget(cities: cities),
                  );
                }
                return const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}




