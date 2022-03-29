import 'package:flutter/material.dart';
import 'package:weather/repository/weather_repository/model/weather.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            20,
          ),
          bottomLeft: Radius.circular(
            20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Details(
              title: 'Humedity',
              value: '${weather.humidity}%',
            ),
            const VerticalDivider(
              color: CustomColor.backgroundColor,
            ),
            Details(
              title: 'Presssure',
              value: '${weather.air_pressure} mbar',
            ),
            const VerticalDivider(
              color: CustomColor.backgroundColor,
            ),
            Details(
              title: 'Wind',
              value: '${weather.wind_speed.round()} mph',
            ),
          ]),
        ),
      ),
    );
  }
}
