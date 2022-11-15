import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hava_durumu/models/current_weather_responsive.dart';
import 'package:hava_durumu/service/api_service.dart';
import 'package:intl/intl.dart';

import '../models/weather_response.dart';
import '../service/hourly_api_service.dart';
//
class WeatherProvider with ChangeNotifier {
  String hourmin = DateFormat('h:mm a').format(DateTime.now());
  currentWeatherResponsive response = currentWeatherResponsive();
  bool isLoading = false;
  bool isLoadingFive = false;
  getWeatherData(context) async{
    isLoading = true;
    response = (await getCurrentData(context))!;
    isLoading = false;
    notifyListeners();
  }
WeatherResponse wresponse = WeatherResponse();
  getData(context, deger) async {
    isLoadingFive = true;
    wresponse = (await getHourlyData(deger.toString()))!;
    isLoadingFive = false;
    //print(wresponse.list![1].dtTxt.toString());
    //print(wresponse.list![0].main!.temp);
    //print(wresponse.list![0].dtTxt.toString().split(" ").last.toString().substring(0,5));
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