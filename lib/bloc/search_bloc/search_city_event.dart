part of 'search_city_bloc.dart';

@immutable
abstract class SearchCityEvent {}

class SearchCity extends SearchCityEvent{
  final String city;
  SearchCity(this.city);
}
