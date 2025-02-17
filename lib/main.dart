import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/cubit.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/states.dart';
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
      child: Builder(
        builder: (context) {
          return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: getWeatherColor(BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
                    useMaterial3: false
                ),
                home: HomeView(),
              );
            },
          );
        },
      ),
    );
  }
}

// class CustomMaterialApp extends StatelessWidget {
//   const CustomMaterialApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           primarySwatch: getWeatherColor(BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherCondition),
//           useMaterial3: false
//       ),
//       home: HomeView(),
//     );
//   }
// }


MaterialColor getWeatherColor(String? day) {
  if (day == null) {
    return Colors.cyan;
  }
  switch (day.toLowerCase()) {
    case "sunny":
      return Colors.orange;
    case "partly cloudy":
      return Colors.blue;
    case "cloudy":
      return Colors.blueGrey;
    case "overcast":
      return Colors.grey;
    case "mist":
      return Colors.teal;
    case "patchy rain possible":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
      return Colors.blue;
    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return Colors.indigo;
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "fog":
    case "freezing fog":
      return Colors.brown;
    default:
      return Colors.cyan;
  }
}