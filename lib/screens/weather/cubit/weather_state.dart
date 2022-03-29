part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  WeatherLoaded({
    required this.weatherList,
    required this.city,
  });

  final List<Weather> weatherList;
  final City city;
}

class WeatherNoData extends WeatherState {
  WeatherNoData(this.message);

  final String message;
}

class WeatherPermission extends WeatherState {
  WeatherPermission(this.message);

  final String message;
}

// ignore: must_be_immutable
class WeatherError extends WeatherState {
  WeatherError({
    required this.errorMessage,
    this.previousCity,
  });

  final String errorMessage;
  late final City? previousCity;
}
