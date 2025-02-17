import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/cubit.dart';
import 'package:weather_app_udemy/models/weather_model.dart';
import 'package:weather_app_udemy/services/weather_services.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
           child: TextField(
             onSubmitted: (value) async {
               var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getWeather(cityName: value);
               Navigator.pop(context);
             },
             decoration: InputDecoration(
               hintText: 'Enter City Name',
               labelText: 'Search',
               suffixIcon: Icon(Icons.search_rounded),
               contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
               border: OutlineInputBorder(
                 borderSide: BorderSide()
               )
             ),
           ),
        ),
      ),
    );
  }
}
