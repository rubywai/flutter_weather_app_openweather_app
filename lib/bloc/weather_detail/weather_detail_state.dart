part of 'weather_detail_bloc.dart';

@immutable
abstract class WeatherDetailState {}

class WeatherDetailInitial extends WeatherDetailState {}

class WeatherDetailLoading extends WeatherDetailState{}

class WeatherDetailSuccess extends WeatherDetailState{
  final CurrentWeatherModel currentWeatherModel;
  WeatherDetailSuccess(this.currentWeatherModel);
}
class WeatherDetailFail extends WeatherDetailState{
  final String errorMessage;
  WeatherDetailFail(this.errorMessage);
}
