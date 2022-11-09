import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:hava_durumu/widgets/hourlyWeather.dart';
import 'package:hava_durumu/widgets/topBar.dart';
import 'package:hava_durumu/widgets/weatherInfo.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 35,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 1.5.h, right: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [TopBar(location: 'Türkiye, Ankara',),
          WeatherInfo(date: "Senin, 20 Desember 2021", time: '3.30 PM', weatherImage: 'assets/rain.png', tempature: 18, forecast: 'Yağmurlu', update: 'Son Güncelleme 3 PM',),
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
            )
           
          ],
        ),
      )
    );
  }
}