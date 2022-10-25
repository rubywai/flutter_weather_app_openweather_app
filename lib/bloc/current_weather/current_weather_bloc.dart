import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/model/current_weather_model.dart';
import 'package:untitled/data/service/weather_api_service.dart';
import 'package:dio/dio.dart';
part 'current_weather_event.dart';
part 'current_weather_state.dart';

class CurrentWeatherBloc extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  WeatherApiService weatherApiService = WeatherApiService(Dio());
  CurrentWeatherBloc() : super(CurrentWeatherLoading()) {
    on<GetCurrentWeather>((event, emit) async{
       emit(CurrentWeatherLoading());
       try{
         CurrentWeatherModel currentWeatherModel = await weatherApiService.getCurrentWeather(lat: event.latitude, lon: event.longitude);
         emit(CurrentWeatherSuccess(currentWeatherModel));
       }
       catch(e){
        print(e);
         emit(CurrentWeatherFailed());
       }
    });
  }
}
