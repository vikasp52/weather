import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';

import '../../../repository/weather_repository/model/model.dart';

class WeekList extends StatelessWidget {
  const WeekList({
    Key? key,
    required this.weatherList,
    required this.scrollDirection,
  }) : super(key: key);

  final List<Weather> weatherList;
  final Axis scrollDirection;

  List<Widget> weekCard({
    required WeatherCubit cubit,
  }) {
    return weatherList
        .asMap()
        .map(
          (index, element) => MapEntry(
              index,
              StreamBuilder<int>(
                  stream: cubit.selectedDayController.stream,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return WeekCard(
                      weather: element,
                      onTap: () => cubit.updateWeatherDetails(
                        weather: element,
                        selectedIndex: index,
                      ),
                      isSelected: index == snapshot.data,
                    );
                  })),
        )
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return SingleChildScrollView(
      scrollDirection: scrollDirection,
      child: (scrollDirection == Axis.horizontal)
          ? Row(
              children: weekCard(
                cubit: cubit,
              ),
            )
          : Column(
              children: weekCard(
                cubit: cubit,
              ),
            ),
    );
  }
}
