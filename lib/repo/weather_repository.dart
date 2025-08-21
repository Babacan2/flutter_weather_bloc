import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {

  final Dio _dio = Dio();
  final String apiKey = 'e2a7b0447144a4adc83afa43def1bc51';

  Future<Weather> fetchWeather(String city) async {
    final response = await _dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {'q': city, 'appid' : apiKey, 'units' : 'metric'});
    return Weather.fromJson(response.data);
  }
}