part of 'search_weather_bloc.dart';

@immutable
abstract class SearchWeatherState {}
class SearchWeatherInitial extends SearchWeatherState{}
class SearchWeatherLoading extends SearchWeatherState{}
class SearchWeatherSuccess extends SearchWeatherState{
  final List<CitySearchResult> cities;
  SearchWeatherSuccess(this.cities);
}
class SearchWeatherFailed extends SearchWeatherState{}
