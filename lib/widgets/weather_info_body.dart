import 'package:flutter/material.dart';
import 'package:weather_app_udemy/main.dart';
import 'package:weather_app_udemy/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    // var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              getWeatherColor(weatherModel.weatherCondition),
              getWeatherColor(weatherModel.weatherCondition).shade200,
              getWeatherColor(weatherModel.weatherCondition)[50]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  // weatherModel.image!.contains('https')
                  "https:${weatherModel.image!}",
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'MaxTemp ${weatherModel.maxTemp.round().toString()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'MinTemp ${weatherModel.minTemp.round().toString()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // DateTime stringToDateTime (String value) {
  //   return DateTime.parse(value);
  // }
}