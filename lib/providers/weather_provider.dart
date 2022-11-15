import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hava_durumu/models/current_weather_responsive.dart';
import 'package:hava_durumu/service/api_service.dart';
import 'package:intl/intl.dart';
//
class WeatherProvider with ChangeNotifier {
  String hourmin = DateFormat('h:mm a').format(DateTime.now());
  currentWeatherResponsive response = currentWeatherResponsive();
  bool isLoading = false;
  getWeatherData(context) async{
    isLoading = true;
    response = (await getCurrentData(context))!;
    isLoading = false;
    notifyListeners();
  }
  
  refreshDate (){
    Timer.periodic(Duration(minutes: 1), (timer){
      hourmin = DateFormat('h:mm a').format(DateTime.now());
      notifyListeners();
    }
    
    );
  }
}