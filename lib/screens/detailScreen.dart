import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:hava_durumu/widgets/MainInformation.dart';
import 'package:hava_durumu/widgets/detailSection.dart';
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
    List<String> saat = ["4.00", "5.00", "6.00", "7.00"];
    List<String> detailImage = [
      "assets/a1.png",
      "assets/a2.png",
      "assets/a3.png",
      "assets/a4.png",
    ];
    List<int> detailDeger =[
      86,940,1,14
    ];
    List<String> detailIsaret = [
      "%",
      "hPa",
      "km/h",
      "%",
    ];
    List<String> detailDurum = [
      "Nem",
      "Hava Basıncı",
      "Rüzgar hızı",
      "Sis",
    ];


    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(gradient: Constant.renkGecis),
            child: Column(
              children: [
                TopBarTwo(
                  location: 'Türkiye, Ankara',
                ),
                MainInformation(
                  date: "Senin, 20 Desember 2021",
                  time: '3.30 PM',
                  weatherImage: 'assets/rain.png',
                  tempature: 18,
                  forecast: 'Yağmurlu',
                  update: 'Son Güncelleme 3 PM',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 3.h),
                    child: Text(
                      "Saatlik Hava Durumu",
                      style: Constant.saatlikStyle,
                    )),
                Container(
                  height: 15.1.h,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: saatlikImage.length,
                    itemBuilder: (context, index) {
                      return HourlyWeather(
                        image: saatlikImage[index],
                        hourlyTempature: saatlikHava[index],
                        saat: saat[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Bilgi Detayları",
                  style: Constant.saatlikStyle,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 2.h),
                  height: 11.h,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 8.h,
                        width: 8.h,
                        child: Stack(
                          children: [
                            Center(
                                child: Text( "12",style:TextStyle(color: Colors.green, fontSize: 24),)),
                            Center(
                              child: SizedBox(
                                height: 8.h,
                                width: 8.h,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.green[600],
                                  value: .12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4.w
                      ),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.h,),
                          Text("AQI - ÇOK İYİ", style: Constant.kalinStyle,),
                          SizedBox(height: 0.5.h,),
                          Container(
                            width: 32.h,
                            child: Text("Bölgenizdeki hava kalitesi şu anda çok iyi. Çeşitli hastalıklara neden olan hava kirliliği yoktur."))
                        ],
                      ),
                      
                    ],
                  ),
                ),
                Container(
                  height: 20.h,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                  itemCount: detailImage.length,  
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  childAspectRatio: 30 / 10,
                  mainAxisSpacing: 2.w,
                  crossAxisSpacing: 5.w,
                  ),
                   itemBuilder: (context, index) {
                     return DetailSection(image: detailImage[index], deger: detailDeger[index], isaret: detailIsaret[index], durum: detailDurum[index]);
                   },),
                ),


               // DetailSection(image: 'assets/a1.png', deger: 86, isaret: '%', durum: 'Nem',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
