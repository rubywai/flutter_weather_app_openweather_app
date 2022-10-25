part of 'search_weather_bloc.dart';

@immutable
abstract class SearchWeatherEvent {}
class SearchWeather extends SearchWeatherEvent{
  final String city;
  SearchWeather(this.city);
}
