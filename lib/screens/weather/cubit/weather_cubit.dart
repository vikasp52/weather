import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:weather/repository/weather_repository/model/model.dart';
import 'package:weather/repository/weather_repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required this.weatherRepository,
  }) : super(WeatherLoading()) {
    determinePosition();
  }

  final WeatherRepossitory weatherRepository;
  var weatherController = StreamController<Weather>.broadcast();
  var selectedDayController = StreamController<int>.broadcast();

  Future<void> determinePosition({String? cityName}) async {
    if (cityName != null) {
      getWeatherData(
        cityName: cityName,
      );
    }

    bool serviceEnabled;
    LocationPermission permission;

    emit(WeatherLoading());

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //return Future.error('Location services are disabled.');
      return emit(WeatherPermission('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return emit(WeatherPermission(
            'Location permissions are denied.\nOR\nYou can search your city'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return emit(WeatherPermission(
          'Location permissions are permanently denied, we cannot request permissions.\nOR\nYou can search your city'));
    }

    final position = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    getWeatherData(
      cityName: place.locality!,
    );
  }

  Future<void> getWeatherData({
    required String cityName,
    City? previousCity,
  }) async {
    late City? city;

    final isConnected = await checkInternet();
    if (!isConnected) {
      return emit(WeatherError(
        errorMessage: 'No internet!\n Please try again.',
        previousCity: previousCity,
      ));
    }

    emit(WeatherLoading());

    if (previousCity == null) {
      city = await weatherRepository.getCity(
        cityName: cityName,
      );
    } else {
      city = previousCity;
    }

    if (city == null) {
      return emit(WeatherNoData('We are not able to find this location'));
    }

    List<Weather> weatherList = await weatherRepository.getConsolidatedWeather(
      woeid: city.woeid,
    );

    if (weatherList.isEmpty) {
      return emit(WeatherNoData('We are not able to find this location'));
    }
    try {
      emit(
        WeatherLoaded(
          weatherList: weatherList,
          city: city,
        ),
      );
    } catch (e) {
      return emit(
        WeatherError(
          errorMessage: 'Something went wrong!\n Please try again.',
          previousCity: city,
        ),
      );
    }
  }

  Future<void> onRefresh({required City city}) async {
    final isConnected = await checkInternet();
    if (!isConnected) {
      return emit(WeatherError(
        errorMessage: 'No internet!\n Please try again.',
        previousCity: city,
      ));
    }

    try {
      List<Weather> weatherList =
          await weatherRepository.getConsolidatedWeather(
        woeid: city.woeid,
      );

      if (weatherList.isEmpty) {
        return emit(WeatherNoData('No data found'));
      }

      emit(
        WeatherLoaded(
          weatherList: weatherList,
          city: city,
        ),
      );
    } catch (e) {
      emit(WeatherError(
        errorMessage: 'Something went wrong!\n Please try again.',
        previousCity: city,
      ));
    }
  }

  void updateWeatherDetails({
    required Weather weather,
    required int selectedIndex,
  }) {
    weatherController.add(weather);
    selectedDayController.add(selectedIndex);
  }

  String getWeekDay(String date) {
    var tempDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat('EEEE').format(tempDate);
  }

  String getDate(String date) {
    var tempDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat('dd MMMM yyyy').format(tempDate);
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  @override
  Future<void> close() async {
    await weatherController.close();
    await selectedDayController.close();
    return super.close();
  }
}
