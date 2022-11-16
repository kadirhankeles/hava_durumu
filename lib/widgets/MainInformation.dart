import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainInformation extends StatelessWidget {
  final String date; 
  final String time;
  final String weatherImage;
  final String tempature;
  final String forecast;
  final String update;
  const MainInformation({super.key, required this.date, required this.time, required this.weatherImage, required this.tempature, required this.forecast, required this.update});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 2.h,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$date ", style: Constant.dateStyle,),
              Text("- $time", style: Constant.dateStyle,)
            ],
          ),
           Container(
            margin: EdgeInsets.only(top: 1.h, bottom: 1.h),
              width:60,
              height: 80,
              child: Image.asset("$weatherImage", fit: BoxFit.contain,)),
               Text("$tempature° C", style: Constant.tempatureStyle,),
               SizedBox(height: 1.h,),
               Text("$forecast", style: Constant.forecastStyle,),
               SizedBox(height: 2.h,),
               Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$update", style: TextStyle(color: Colors.white, fontSize: 12),),
            SizedBox(width: 1.w,),
            Icon(Icons.refresh_outlined, size: 16, color: Colors.white,)
          ],
        ),
        ],
      ),
    );
  }
}