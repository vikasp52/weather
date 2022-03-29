import 'package:flutter/material.dart';
import 'package:weather/repository/weather_repository/model/model.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class VerticalView extends StatelessWidget {
  const VerticalView({
    Key? key,
    required this.weatherState,
    required this.cubit,
  }) : super(key: key);

  final WeatherLoaded weatherState;
  final WeatherCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              weatherState.city.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor.whiteColor,
              ),
            ),
          ),
          StreamBuilder<Weather>(
              stream: cubit.weatherController.stream,
              initialData: weatherState.weatherList.first,
              builder: (context, snapshot) {
                return WeatherCardDetails(
                  weather: snapshot.data!,
                );
              }),
          const Text(
            'Next days',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColor.whiteColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          WeekList(
            weatherList: weatherState.weatherList,
            scrollDirection: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}
