import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weatherModel.weatherCondition),
          getThemeColor(weatherModel.weatherCondition)[300]!,
          getThemeColor(weatherModel.weatherCondition)[50]!
        ],
        end: Alignment.bottomCenter,
        begin: Alignment.topCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxemp : ${weatherModel.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Minemp : ${weatherModel.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
