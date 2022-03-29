// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Weather _$$_WeatherFromJson(Map<String, dynamic> json) => _$_Weather(
      weather_state_name: json['weather_state_name'] as String,
      weather_state_abbr: json['weather_state_abbr'] as String,
      applicable_date: json['applicable_date'] as String,
      min_temp: (json['min_temp'] as num).toDouble(),
      max_temp: (json['max_temp'] as num).toDouble(),
      the_temp: (json['the_temp'] as num).toDouble(),
      wind_speed: (json['wind_speed'] as num).toDouble(),
      air_pressure: (json['air_pressure'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$$_WeatherToJson(_$_Weather instance) =>
    <String, dynamic>{
      'weather_state_name': instance.weather_state_name,
      'weather_state_abbr': instance.weather_state_abbr,
      'applicable_date': instance.applicable_date,
      'min_temp': instance.min_temp,
      'max_temp': instance.max_temp,
      'the_temp': instance.the_temp,
      'wind_speed': instance.wind_speed,
      'air_pressure': instance.air_pressure,
      'humidity': instance.humidity,
    };
