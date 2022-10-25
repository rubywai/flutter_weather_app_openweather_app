import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/data/service/weather_api_service.dart';

part 'search_weather_event.dart';
part 'search_weather_state.dart';

class SearchWeatherBloc extends Bloc<SearchWeatherEvent, SearchWeatherState> {
  final WeatherApiService _weatherApiService = WeatherApiService(Dio());
  SearchWeatherBloc() : super(SearchWeatherInitial()) {
    on<SearchWeather>((event, emit) async{
       emit(SearchWeatherLoading());
       try{
          List<CitySearchResult> cities= await _weatherApiService.searchCity(city: event.city);
          emit(SearchWeatherSuccess(cities));
       }
       catch(e){
         print(e);
        emit(SearchWeatherFailed());
       }
    });
  }
}
