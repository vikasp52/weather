import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/screens/weather/cubit/weather_cubit.dart';

class SearchWeather extends StatefulWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  State<SearchWeather> createState() => _SearchWeatherState();
}

class _SearchWeatherState extends State<SearchWeather> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void submit(WeatherCubit weatherCubit) {
    if (_textEditingController.text.trimLeft().trimRight().isNotEmpty) {
      FocusScope.of(context).unfocus();

      weatherCubit.getWeatherData(
        cityName: _textEditingController.text,
      );
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeatherCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _textEditingController,
          onFieldSubmitted: (value) => submit(cubit),
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp("[a-zA-Z ]"),
            ),
          ],
          decoration: InputDecoration(
            hintText: 'Enter city name',
            hintStyle: const TextStyle(
              color: Color(0xffa19d9d),
              fontWeight: FontWeight.w500,
            ),
            fillColor: Colors.blue,
            border: InputBorder.none,
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => submit(cubit),
              icon: const Icon(
                Icons.search_outlined,
              ),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
