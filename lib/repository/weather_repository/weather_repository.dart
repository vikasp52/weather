import 'dart:convert';
import 'package:weather/network/constant.dart';
import 'package:http/http.dart' as http;
import 'package:weather/repository/weather_repository/model/model.dart';

class WeatherRepossitory {
  Future<City?> getCity({
    required String cityName,
  }) async {
    String url = Constants.baseUrl + Constants.searchLocation + cityName;

    final response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        var city = jsonDecode(response.body);
        return City.fromJson(city.first);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Weather>> getConsolidatedWeather({
    required int woeid,
  }) async {
    String url = Constants.baseUrl + Constants.locationData + woeid.toString();

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body)['consolidated_weather']
          .cast<Map<String, dynamic>>();
      var weather =
          parsed.map<Weather>((json) => Weather.fromJson(json)).toList();
      return weather;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
