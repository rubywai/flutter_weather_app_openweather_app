// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WeatherApiService implements WeatherApiService {
  _WeatherApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://api.openweathermap.org/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<CitySearchResult>> searchCity({required city}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': city};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<CitySearchResult>>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options,
                'geo/1.0/direct?limit=10&appid=1a8ac56b8a47eeeae81e7bea8a3e57fc',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map(
            (dynamic i) => CitySearchResult.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeather(
      {required lat, required lon}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lat': lat, r'lon': lon};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        CurrentWeatherModel>(Options(
            method: 'GET', headers: _headers, extra: _extra)
        .compose(_dio.options,
            'data/2.5/weather?appid=1a8ac56b8a47eeeae81e7bea8a3e57fc&units=metric',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CurrentWeatherModel.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
