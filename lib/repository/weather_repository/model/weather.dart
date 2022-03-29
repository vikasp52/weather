import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required String weather_state_name,
    required String weather_state_abbr,
    required String applicable_date,
    required double min_temp,
    required double max_temp,
    required double the_temp,
    required double wind_speed,
    required double air_pressure,
    required int humidity,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
