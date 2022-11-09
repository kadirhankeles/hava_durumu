import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DaysWeather extends StatelessWidget {
  final String image;
  final String gun;
  final String durum;
  final int derece;
  const DaysWeather({super.key, required this.image, required this.gun, required this.derece, required this.durum});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
      padding: EdgeInsets.only(right: 2.h, left: 2.h),
      height: 9.h,
      width: double.infinity,
      //color: Colors.red,
      decoration: BoxDecoration(color: Color(0xffD2DFFF), borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 4.w,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
               // color: Colors.red,
                width: 14.h,
                child: Text("$gun", style: Constant.kalinStyle,)),
              Container(
                width: 14.h,
                //color: Colors.red,
                child: Text("$durum", style: Constant.duzStyle,)),
            ],
          ),
          SizedBox(width: 24.w,),
          Text("$derece° C ", style: Constant.kalinStyle,),
          InkWell(
            onTap: () {
              
            },
            child: Icon(Icons.arrow_right, size: 26,)),

        ],
      ),
    );
  }
}