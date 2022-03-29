import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/network/constant.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/util/colors.dart';

import '../../../repository/weather_repository/model/model.dart';

class WeekCard extends StatelessWidget {
  const WeekCard({
    Key? key,
    required this.weather,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final Weather weather;
  final GestureTapCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        color: isSelected ? CustomColor.cardColor : CustomColor.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                cubit.getWeekDay(weather.applicable_date),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? CustomColor.whiteColor
                      : CustomColor.cardColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SvgPicture.network(
                Constants.imageUrl + '${weather.weather_state_abbr}.svg',
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${weather.min_temp.round()}°C / ${weather.max_temp.round()}°C',
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected
                      ? CustomColor.whiteColor
                      : CustomColor.cardColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
