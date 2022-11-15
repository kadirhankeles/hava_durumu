import 'dart:convert';
import 'dart:developer';

import 'package:hava_durumu/models/weather_response.dart';

import "package:http/http.dart" as http;

Future<WeatherResponse?> getHourlyData(String deger) async {
  try {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=41.011218&lon=28.978178&appid=07de6e352cc77e781ec578c937639967&units=metric"));
    return WeatherResponse.fromJson(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
  }
  return null;
}
