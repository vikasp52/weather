// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return _Weather.fromJson(json);
}

/// @nodoc
class _$WeatherTearOff {
  const _$WeatherTearOff();

  _Weather call(
      {required String weather_state_name,
      required String weather_state_abbr,
      required String applicable_date,
      required double min_temp,
      required double max_temp,
      required double the_temp,
      required double wind_speed,
      required double air_pressure,
      required int humidity}) {
    return _Weather(
      weather_state_name: weather_state_name,
      weather_state_abbr: weather_state_abbr,
      applicable_date: applicable_date,
      min_temp: min_temp,
      max_temp: max_temp,
      the_temp: the_temp,
      wind_speed: wind_speed,
      air_pressure: air_pressure,
      humidity: humidity,
    );
  }

  Weather fromJson(Map<String, Object?> json) {
    return Weather.fromJson(json);
  }
}

/// @nodoc
const $Weather = _$WeatherTearOff();

/// @nodoc
mixin _$Weather {
  String get weather_state_name => throw _privateConstructorUsedError;
  String get weather_state_abbr => throw _privateConstructorUsedError;
  String get applicable_date => throw _privateConstructorUsedError;
  double get min_temp => throw _privateConstructorUsedError;
  double get max_temp => throw _privateConstructorUsedError;
  double get the_temp => throw _privateConstructorUsedError;
  double get wind_speed => throw _privateConstructorUsedError;
  double get air_pressure => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherCopyWith<Weather> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherCopyWith<$Res> {
  factory $WeatherCopyWith(Weather value, $Res Function(Weather) then) =
      _$WeatherCopyWithImpl<$Res>;
  $Res call(
      {String weather_state_name,
      String weather_state_abbr,
      String applicable_date,
      double min_temp,
      double max_temp,
      double the_temp,
      double wind_speed,
      double air_pressure,
      int humidity});
}

/// @nodoc
class _$WeatherCopyWithImpl<$Res> implements $WeatherCopyWith<$Res> {
  _$WeatherCopyWithImpl(this._value, this._then);

  final Weather _value;
  // ignore: unused_field
  final $Res Function(Weather) _then;

  @override
  $Res call({
    Object? weather_state_name = freezed,
    Object? weather_state_abbr = freezed,
    Object? applicable_date = freezed,
    Object? min_temp = freezed,
    Object? max_temp = freezed,
    Object? the_temp = freezed,
    Object? wind_speed = freezed,
    Object? air_pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      weather_state_name: weather_state_name == freezed
          ? _value.weather_state_name
          : weather_state_name // ignore: cast_nullable_to_non_nullable
              as String,
      weather_state_abbr: weather_state_abbr == freezed
          ? _value.weather_state_abbr
          : weather_state_abbr // ignore: cast_nullable_to_non_nullable
              as String,
      applicable_date: applicable_date == freezed
          ? _value.applicable_date
          : applicable_date // ignore: cast_nullable_to_non_nullable
              as String,
      min_temp: min_temp == freezed
          ? _value.min_temp
          : min_temp // ignore: cast_nullable_to_non_nullable
              as double,
      max_temp: max_temp == freezed
          ? _value.max_temp
          : max_temp // ignore: cast_nullable_to_non_nullable
              as double,
      the_temp: the_temp == freezed
          ? _value.the_temp
          : the_temp // ignore: cast_nullable_to_non_nullable
              as double,
      wind_speed: wind_speed == freezed
          ? _value.wind_speed
          : wind_speed // ignore: cast_nullable_to_non_nullable
              as double,
      air_pressure: air_pressure == freezed
          ? _value.air_pressure
          : air_pressure // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$WeatherCopyWith<$Res> implements $WeatherCopyWith<$Res> {
  factory _$WeatherCopyWith(_Weather value, $Res Function(_Weather) then) =
      __$WeatherCopyWithImpl<$Res>;
  @override
  $Res call(
      {String weather_state_name,
      String weather_state_abbr,
      String applicable_date,
      double min_temp,
      double max_temp,
      double the_temp,
      double wind_speed,
      double air_pressure,
      int humidity});
}

/// @nodoc
class __$WeatherCopyWithImpl<$Res> extends _$WeatherCopyWithImpl<$Res>
    implements _$WeatherCopyWith<$Res> {
  __$WeatherCopyWithImpl(_Weather _value, $Res Function(_Weather) _then)
      : super(_value, (v) => _then(v as _Weather));

  @override
  _Weather get _value => super._value as _Weather;

  @override
  $Res call({
    Object? weather_state_name = freezed,
    Object? weather_state_abbr = freezed,
    Object? applicable_date = freezed,
    Object? min_temp = freezed,
    Object? max_temp = freezed,
    Object? the_temp = freezed,
    Object? wind_speed = freezed,
    Object? air_pressure = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_Weather(
      weather_state_name: weather_state_name == freezed
          ? _value.weather_state_name
          : weather_state_name // ignore: cast_nullable_to_non_nullable
              as String,
      weather_state_abbr: weather_state_abbr == freezed
          ? _value.weather_state_abbr
          : weather_state_abbr // ignore: cast_nullable_to_non_nullable
              as String,
      applicable_date: applicable_date == freezed
          ? _value.applicable_date
          : applicable_date // ignore: cast_nullable_to_non_nullable
              as String,
      min_temp: min_temp == freezed
          ? _value.min_temp
          : min_temp // ignore: cast_nullable_to_non_nullable
              as double,
      max_temp: max_temp == freezed
          ? _value.max_temp
          : max_temp // ignore: cast_nullable_to_non_nullable
              as double,
      the_temp: the_temp == freezed
          ? _value.the_temp
          : the_temp // ignore: cast_nullable_to_non_nullable
              as double,
      wind_speed: wind_speed == freezed
          ? _value.wind_speed
          : wind_speed // ignore: cast_nullable_to_non_nullable
              as double,
      air_pressure: air_pressure == freezed
          ? _value.air_pressure
          : air_pressure // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: humidity == freezed
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Weather implements _Weather {
  const _$_Weather(
      {required this.weather_state_name,
      required this.weather_state_abbr,
      required this.applicable_date,
      required this.min_temp,
      required this.max_temp,
      required this.the_temp,
      required this.wind_speed,
      required this.air_pressure,
      required this.humidity});

  factory _$_Weather.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherFromJson(json);

  @override
  final String weather_state_name;
  @override
  final String weather_state_abbr;
  @override
  final String applicable_date;
  @override
  final double min_temp;
  @override
  final double max_temp;
  @override
  final double the_temp;
  @override
  final double wind_speed;
  @override
  final double air_pressure;
  @override
  final int humidity;

  @override
  String toString() {
    return 'Weather(weather_state_name: $weather_state_name, weather_state_abbr: $weather_state_abbr, applicable_date: $applicable_date, min_temp: $min_temp, max_temp: $max_temp, the_temp: $the_temp, wind_speed: $wind_speed, air_pressure: $air_pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Weather &&
            const DeepCollectionEquality()
                .equals(other.weather_state_name, weather_state_name) &&
            const DeepCollectionEquality()
                .equals(other.weather_state_abbr, weather_state_abbr) &&
            const DeepCollectionEquality()
                .equals(other.applicable_date, applicable_date) &&
            const DeepCollectionEquality().equals(other.min_temp, min_temp) &&
            const DeepCollectionEquality().equals(other.max_temp, max_temp) &&
            const DeepCollectionEquality().equals(other.the_temp, the_temp) &&
            const DeepCollectionEquality()
                .equals(other.wind_speed, wind_speed) &&
            const DeepCollectionEquality()
                .equals(other.air_pressure, air_pressure) &&
            const DeepCollectionEquality().equals(other.humidity, humidity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(weather_state_name),
      const DeepCollectionEquality().hash(weather_state_abbr),
      const DeepCollectionEquality().hash(applicable_date),
      const DeepCollectionEquality().hash(min_temp),
      const DeepCollectionEquality().hash(max_temp),
      const DeepCollectionEquality().hash(the_temp),
      const DeepCollectionEquality().hash(wind_speed),
      const DeepCollectionEquality().hash(air_pressure),
      const DeepCollectionEquality().hash(humidity));

  @JsonKey(ignore: true)
  @override
  _$WeatherCopyWith<_Weather> get copyWith =>
      __$WeatherCopyWithImpl<_Weather>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherToJson(this);
  }
}

abstract class _Weather implements Weather {
  const factory _Weather(
      {required String weather_state_name,
      required String weather_state_abbr,
      required String applicable_date,
      required double min_temp,
      required double max_temp,
      required double the_temp,
      required double wind_speed,
      required double air_pressure,
      required int humidity}) = _$_Weather;

  factory _Weather.fromJson(Map<String, dynamic> json) = _$_Weather.fromJson;

  @override
  String get weather_state_name;
  @override
  String get weather_state_abbr;
  @override
  String get applicable_date;
  @override
  double get min_temp;
  @override
  double get max_temp;
  @override
  double get the_temp;
  @override
  double get wind_speed;
  @override
  double get air_pressure;
  @override
  int get humidity;
  @override
  @JsonKey(ignore: true)
  _$WeatherCopyWith<_Weather> get copyWith =>
      throw _privateConstructorUsedError;
}
