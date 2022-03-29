import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/repository/weather_repository/model/city.dart';
import 'package:weather/repository/weather_repository/model/weather.dart';
import 'package:weather/repository/weather_repository/weather_repository.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';

class MockWeatherepository extends Mock implements WeatherRepossitory {}

main() {
  late MockWeatherepository mockWeatherepository;
  late WeatherCubit weatherCubit;

  var weatherData = const Weather(
    weather_state_name: "Clear",
    weather_state_abbr: "c",
    applicable_date: "2022-03-27",
    min_temp: 22.365000000000002,
    max_temp: 39.349999999999994,
    the_temp: 36.835,
    wind_speed: 6.8638248800074235,
    air_pressure: 1008.5,
    humidity: 15,
  );

  var city = const City(
    title: 'Mumbai',
    woeid: 12586539,
  );

  var weatrherList = [weatherData, weatherData];

  setUp(() {
    mockWeatherepository = MockWeatherepository();

    weatherCubit = WeatherCubit(weatherRepository: mockWeatherepository);

    when(() => mockWeatherepository.getCity(cityName: 'Mumbai'))
        .thenAnswer((_) async => city);

    when(() => mockWeatherepository.getConsolidatedWeather(woeid: 12586539))
        .thenAnswer((_) async => weatrherList);

    when(() => weatherCubit.checkInternet().then((_) async => false));
  });

  tearDown(() {
    weatherCubit.close();
  });

  test(
    'Bloc should have initial state as [InitialState]',
    () => expect(weatherCubit.state.runtimeType, WeatherLoading),
  );

  blocTest(
    'Should emit [WeatherLoading, WeatherLoaded] on home',
    build: () => weatherCubit,
    act: (WeatherCubit cubit) {
      when(() => mockWeatherepository.getCity(cityName: 'Mumbai'))
          .thenAnswer((_) async => city);

      when(() => mockWeatherepository.getConsolidatedWeather(woeid: 12586539))
          .thenAnswer((_) async => weatrherList);

      when(() => weatherCubit.checkInternet().then((_) async => true));

      cubit.getWeatherData(cityName: 'Mumbai');
    },
    expect: () => [
      isA<WeatherLoading>(),
      isA<WeatherLoaded>(),
    ],
  );

  blocTest(
    'Should emit [WeatherError] on home',
    build: () => weatherCubit,
    act: (WeatherCubit cubit) {
      cubit.getWeatherData(cityName: 'Mumbai');
    },
    expect: () => [
      isA<WeatherError>(),
    ],
  );
}
