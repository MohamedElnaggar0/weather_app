import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Clear':
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.yellow;
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.blue;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Patchy light rain with thunder':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Torrential rain shower':
    case 'Moderate or heavy rain shower':
    case 'Moderate or heavy rain with thunder':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy light snow with thunder':
    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.blue;
    case 'Fog':
    case 'Freezing fog':
      return Colors.blueGrey;
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Moderate snow':
    case 'Patchy moderate snow':
    case 'Heavy snow':
    case 'Patchy heavy snow':
    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.grey;

    default:
      return Colors.blue;
  }
}
