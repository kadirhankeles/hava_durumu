import 'dart:convert';
import 'dart:developer';

import '../models/current_weather_responsive.dart';
import 'package:http/http.dart' as http;
// model dosyası oluşturduk, 
Future<currentWeatherResponsive?> getCurrentData(context) async{
  currentWeatherResponsive weatherResponsive;
  try{
    final response =await http.get(Uri.parse
    ("https://api.openweathermap.org/data/2.5/weather?lat=41.011218&lon=28.978178&appid=3f9a2a03d25db304d021bd6bd30d5f8a"));
    weatherResponsive = currentWeatherResponsive.fromJson(jsonDecode(response.body));
    print(response.body);
    return weatherResponsive;
  } catch (e){
    log(e.toString());
  }
  return null;
}