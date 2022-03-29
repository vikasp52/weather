import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repository/weather_repository/model/model.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';
import 'package:weather/screens/weather/widgets/widgets.dart';
import 'package:weather/util/colors.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Scaffold(
      backgroundColor: CustomColor.backgroundColor,
      //appBar: weatherAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SearchWeather(),
              BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, weatherState) {
                  if (weatherState is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    );
                  }

                  if (weatherState is WeatherNoData) {
                    return WeatherPermissionMessage(
                        message: weatherState.message);
                  }

                  if (weatherState is WeatherPermission) {
                    return WeatherPermissionMessage(
                        message: weatherState.message);
                  }

                  if (weatherState is WeatherError) {
                    return Center(
                        child: ErrorScreen(
                      errorMessage: weatherState.errorMessage,
                      onPressed: () => cubit.determinePosition(
                        cityName: weatherState.previousCity?.title,
                      ),
                    ));
                  }

                  if (weatherState is WeatherLoaded) {
                    return RefreshIndicator(
                      onRefresh: () async => cubit.onRefresh(
                        city: weatherState.city,
                      ),
                      child: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? LandScapeView(
                              cubit: cubit,
                              weatherState: weatherState,
                            )
                          : VerticalView(
                              cubit: cubit,
                              weatherState: weatherState,
                            ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
