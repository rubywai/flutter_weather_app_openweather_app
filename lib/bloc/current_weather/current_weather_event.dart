part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherEvent {}

class GetCurrentWeather extends CurrentWeatherEvent{
  final double latitude;
  final double longitude;
  GetCurrentWeather(this.latitude, this.longitude);
}