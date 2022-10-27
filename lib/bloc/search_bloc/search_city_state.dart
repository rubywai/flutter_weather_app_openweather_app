part of 'search_city_bloc.dart';

@immutable
abstract class SearchCityState {}

class SearchCityInitial extends SearchCityState {}

class SearchCityLoading extends SearchCityState{}

class SearchCitySuccess extends SearchCityState{
  final List<CitySearchResult> cities;
  SearchCitySuccess(this.cities);
}
class SearchCityFailed extends SearchCityState{
  final String errorMessage;
  SearchCityFailed(this.errorMessage);
}
