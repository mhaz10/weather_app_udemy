import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/cubit.dart';
import 'package:weather_app_udemy/cubits/get_weather_cubit/states.dart';
import 'package:weather_app_udemy/views/search_view.dart';
import 'package:weather_app_udemy/widgets/no_weather_body.dart';
import 'package:weather_app_udemy/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchView()));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,WeatherState>
        (builder: (context, state) {
        if (state is WeatherInitialState)
          return NoWeatherBody();
        else if(state is WeatherLoadedState)
          return WeatherInfoBody(weatherModel: state.weatherModel);
        else
          return Text('oops there was an error');
      }),
    );
  }
}