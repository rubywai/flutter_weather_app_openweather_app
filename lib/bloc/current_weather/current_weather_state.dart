part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}
class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherModel currentWeatherModel;
  CurrentWeatherSuccess(this.currentWeatherModel);
}
class CurrentWeatherFailed extends CurrentWeatherState{}
