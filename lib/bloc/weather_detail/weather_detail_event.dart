part of 'weather_detail_bloc.dart';

@immutable
abstract class WeatherDetailEvent {}

class WeatherDetail extends WeatherDetailEvent{
  final String name;
  final double lat;
  final double log;
  WeatherDetail(this.name, this.lat, this.log);
}
