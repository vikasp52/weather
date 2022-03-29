import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repository/weather_repository/model/model.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class WeatherCardDetails extends StatelessWidget {
  const WeatherCardDetails({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        WeatherCard(
          weather: weather,
        ),
        WeatherDetails(
          weather: weather,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
