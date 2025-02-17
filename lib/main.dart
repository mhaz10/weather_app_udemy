import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/cubit.dart';
import 'package:weather_app_udemy/views/home_view%20.dart';

// 1 - create states
// 2 - create cubit
// 3 - create function
// 4 - provide cubit
// 5 - integrate cubit
// 6 - trigger cubit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}