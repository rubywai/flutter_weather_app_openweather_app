
import 'package:retrofit/retrofit.dart';
import 'package:untitled/cost/api_const.dart';
import 'package:dio/dio.dart';
import 'package:untitled/data/model/city_search_model.dart';
import 'package:untitled/data/model/current_weather_model.dart';
part 'weather_api_service.g.dart';
@RestApi(baseUrl: ApiConst.BASE_URL)
abstract class WeatherApiService{
  factory WeatherApiService(Dio dio) => _WeatherApiService(dio);

  @GET('${ApiConst.CITY_SEARCH}?limit=10&appid=${ApiConst.APIKEY}')
  Future<List<CitySearchResult>> searchCity({@Query('q') required String city,});
  
  @GET('${ApiConst.CURRENT_WEATHER}?appid=${ApiConst.APIKEY}&units=metric')
  Future<CurrentWeatherModel> getCurrentWeather({@Query('lat') required double lat,@Query('lon') required double lon});

}