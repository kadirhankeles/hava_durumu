import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/weather_provider.dart';

class WeatherInfo extends StatelessWidget {
  final String date; 
  final String time;
  final String weatherImage;
  final double tempature;
  final String forecast;
  final String update;
  const WeatherInfo({super.key, required this.date, required this.time, required this.weatherImage, required this.tempature, required this.forecast, required this.update});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: double.infinity,
      
      decoration: BoxDecoration(//color: Colors.red, 
      borderRadius: BorderRadius.circular(20),
      gradient: Constant.renkGecis
     ),

     child: Padding(
       padding: const EdgeInsets.all(25.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('$date', style: Constant.dateStyle,),
              SizedBox(width: 30.w,),
              Text("$time", style: Constant.dateStyle,),
            ],
          ),
          SizedBox(height: 2.h,),
        Row(
          children: [
            Container(
              width:60,
              height: 80,
              padding: EdgeInsets.only(right: 10),
              child: Image.asset("$weatherImage", fit: BoxFit.contain,)),
              Container(
              width:  200,
              height: 70,
              //color: Colors.red,
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$tempature° C", style: Constant.tempatureStyle,),
                    SizedBox(height: 0.5.h,),
                    Text("$forecast", style: Constant.forecastStyle,),
                  ],
                ),
              )
          ],
        ),
        Row(
          children: [
            Text("$update", style: TextStyle(color: Colors.white, fontSize: 12),),
            SizedBox(width: 1.w,),
            GestureDetector(onTap: () {
             Provider.of<WeatherProvider>(context, listen: false).getWeatherData(context);
            }, child: Icon(Icons.refresh_outlined, size: 16, color: Colors.white,))
            
          ],
        ),
        ],
       ),
     ),
    );
  }
}