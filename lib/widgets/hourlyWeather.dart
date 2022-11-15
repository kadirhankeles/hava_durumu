import 'package:flutter/material.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HourlyWeather extends StatelessWidget {
  final String image;
  final double hourlyTempature;
  final String saat;
  const HourlyWeather({super.key, required this.image, required this.hourlyTempature, required this.saat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h, right: 1.h),
      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
      height: 14.h,
      width: 10.5.h,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset("$image",fit: BoxFit.contain,)),
            SizedBox(height: 1.h,),
          Text("$hourlyTempature° C", style: Constant.saatlikStyle,),
          SizedBox(height: 0.5.h,),
          Text("$saat PM")
        ],
      ),


    );
  }
}