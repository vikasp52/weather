import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/network/constant.dart';
import 'package:weather/repository/weather_repository/model/weather.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/util/colors.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Card(
      color: CustomColor.cardColor,
      margin: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.getWeekDay(weather.applicable_date),
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        cubit.getDate(
                          weather.applicable_date,
                        ),
                        style: const TextStyle(
                          color: CustomColor.yellowColor,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        '${weather.the_temp.round()}°C',
                        style: const TextStyle(
                          color: CustomColor.yellowColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        weather.weather_state_name,
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  color: CustomColor.whiteColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 30,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.network(
                        Constants.imageUrl +
                            '${weather.weather_state_abbr}.svg',
                        height: 70,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Min: ${weather.min_temp.round()}°C\nMax: ${weather.max_temp.round()}°C',
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
