import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_udemy/models/weather_model.dart';

class WeatherServices {
  Dio dio;

  WeatherServices(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'beab4c465da140e2bbb151549251502';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1'
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String? errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}