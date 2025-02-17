import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/states.dart';
import 'package:weather_app_udemy/models/weather_model.dart';
import 'package:weather_app_udemy/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  // late WeatherModel weatherModel;
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
      await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}