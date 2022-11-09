import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:hava_durumu/widgets/MainInformation.dart';
import 'package:hava_durumu/widgets/topBarTwo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/hourlyWeather.dart';

class DetailScreen extends StatelessWidget {
  
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
     List<String> saatlikImage = [
      "assets/sun2.png",
      "assets/rain.png",
      "assets/snow.png",
      "assets/sun2.png",
    ];
    List<int> saatlikHava = [
      18,
      19,
      20,
      17,
    ];
    List<String> saat =[
      "4.00",
      "5.00",
      "6.00",
      "7.00"
    ];
    return Scaffold(
      body: Column(
        
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              gradient: Constant.renkGecis
            ),
            child: Column(
              children: [
                TopBarTwo(location: 'Türkiye, Ankara',),
                MainInformation(date: "Senin, 20 Desember 2021", time: '3.30 PM', weatherImage: 'assets/rain.png', tempature: 18, forecast: 'Yağmurlu', update: 'Son Güncelleme 3 PM',),
                 
              ],
            ),
            
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                margin: EdgeInsets.only(top: 3.h),
                child: Text("Saatlik Hava Durumu", style: Constant.saatlikStyle,)),
                Container(
                  height: 15.1.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: saatlikImage.length,
                    itemBuilder:(context, index) {
                      return HourlyWeather(image: saatlikImage[index], hourlyTempature: saatlikHava[index], saat: saat[index],);
                  }, ),
                ),
              ],
            ),
          )
          
        ],
      ),
    );
  }
}