import 'package:untitled/cost/api_const.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/data/model/current_weather_model.dart';
import 'package:untitled/data/service/weather_api_service.dart';
import 'package:dio/dio.dart';
import 'package:untitled/data/service/weather_api_service.dart';

class WeatherRepository {
  late WeatherApiService _weatherApiService;
  final String appId;

  WeatherRepository(this.appId) {
    final Dio dio = Dio();
    _weatherApiService = WeatherApiService(dio);
  }

  Future<List<CitySearchResult>> searchCity({required String city}) =>
      _weatherApiService.searchCity(city: city, limit: 10, appId: appId);

  Future<CurrentWeatherModel> getCurrentWeather(
          {required double lat, required double lon}) =>
      _weatherApiService.getCurrentWeather(
          lat: lat, lon: lon, appId: appId, unit: ApiConst.UNIT);
}
