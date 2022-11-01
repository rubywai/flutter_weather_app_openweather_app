import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/model/current_weather_model.dart';
import 'package:untitled/data/weather_repository.dart';

part 'weather_detail_event.dart';
part 'weather_detail_state.dart';

class WeatherDetailBloc extends Bloc<WeatherDetailEvent, WeatherDetailState> {
  WeatherDetailBloc() : super(WeatherDetailInitial()) {
    WeatherRepository _repository = WeatherRepository();
    on<WeatherDetail>((event, emit) async {
      double lat = event.lat;
      double lon = event.log;
      emit(WeatherDetailLoading());
      try {
        CurrentWeatherModel currentWeatherModel = await _repository
            .getCurrentWeather(lat: lat, lon: lon);
        emit(WeatherDetailSuccess(currentWeatherModel));
      }
      catch(_){
        emit(WeatherDetailFail('Something wrong'));
      }
    });
  }
}
