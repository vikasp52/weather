import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/network/constant.dart';
import 'package:weather/repository/weather_repository/model/weather.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class LandscapeWeatherCard extends StatelessWidget {
  const LandscapeWeatherCard({
    Key? key,
    required this.weather,
    required this.cubit,
  }) : super(key: key);

  final Weather weather;
  final WeatherCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          color: CustomColor.cardColor,
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20,
              ),
              bottomLeft: Radius.circular(
                20,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        cubit.getWeekDay(weather.applicable_date),
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                          fontSize: 16,
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
                          fontSize: 36,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        weather.weather_state_name,
                        style: const TextStyle(
                          color: CustomColor.whiteColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const VerticalDivider(
                    color: CustomColor.whiteColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    child: Column(
                      children: [
                        SvgPicture.network(
                          Constants.imageUrl +
                              '${weather.weather_state_abbr}.svg',
                          height: 90,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Min: ${weather.min_temp.round()}°C\nMax: ${weather.max_temp.round()}°C',
                          style: const TextStyle(
                            color: CustomColor.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          //width: double.maxFinite,
          decoration: const BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                20,
              ),
              bottomRight: Radius.circular(
                20,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IntrinsicWidth(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Details(
                    title: 'Humedity',
                    value: '${weather.humidity}%',
                    titleFontSize: 16,
                    valueFontSize: 20,
                  ),
                  const Divider(
                    color: CustomColor.backgroundColor,
                  ),
                  Details(
                    title: 'Presssure',
                    value: '${weather.air_pressure} mbar',
                    titleFontSize: 16,
                    valueFontSize: 20,
                  ),
                  const Divider(
                    color: CustomColor.backgroundColor,
                  ),
                  Details(
                    title: 'Wind',
                    value: '${weather.wind_speed.round()} mph',
                    titleFontSize: 16,
                    valueFontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
