import 'package:flutter/cupertino.dart';
import 'package:hava_durumu/models/current_weather_responsive.dart';
import 'package:hava_durumu/service/api_service.dart';
//
class WeatherProvider with ChangeNotifier {
  currentWeatherResponsive response = currentWeatherResponsive();
  bool isLoading = false;
  getWeatherData(context) async{
    isLoading = true;
    response = (await getCurrentData(context))!;
    isLoading = false;
    notifyListeners();
  }
}