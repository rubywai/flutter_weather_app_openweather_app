import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/data/weather_repository.dart';

part 'search_city_event.dart';
part 'search_city_state.dart';

class SearchCityBloc extends Bloc<SearchCityEvent, SearchCityState> {
  final WeatherRepository _weatherRepository = WeatherRepository();
  SearchCityBloc() : super(SearchCityInitial()) {
    on<SearchCity>((event, emit) async{
       try {
         emit(SearchCityLoading());
         List<CitySearchResult> cities = await _weatherRepository.searchCity(
             city: event.city);
         emit(SearchCitySuccess(cities));
       }
       catch(e){
         emit(SearchCityFailed('Something wrong'));
       }

    });
  }
}
