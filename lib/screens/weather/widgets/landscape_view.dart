import 'package:flutter/material.dart';
import 'package:weather/repository/weather_repository/model/model.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class LandScapeView extends StatelessWidget {
  const LandScapeView({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                weatherState.city.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whiteColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<Weather>(
                stream: cubit.weatherController.stream,
                initialData: weatherState.weatherList.first,
                builder: (context, snapshot) {
                  return LandscapeWeatherCard(
                    cubit: cubit,
                    weather: snapshot.data!,
                  );
                },
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Next days',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whiteColor,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 200,
                child: WeekList(
                  weatherList: weatherState.weatherList,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
