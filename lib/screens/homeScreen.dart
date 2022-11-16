import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:hava_durumu/providers/weather_provider.dart';
import 'package:hava_durumu/screens/detailScreen.dart';
import 'package:hava_durumu/widgets/Information.dart';
import 'package:hava_durumu/widgets/daysWeather.dart';
import 'package:hava_durumu/widgets/hourlyWeather.dart';
import 'package:hava_durumu/widgets/topBar.dart';
import 'package:hava_durumu/widgets/weatherInfo.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? time;
  @override
  WeatherProvider? wetProvider;
  void initState() {
    // TODO: implement initState

    /*DateTime current = DateTime.now();
    
    Stream timer = Stream.periodic(Duration(seconds: 1), (i) {
      current = current.add(Duration(seconds: 1));
      return current;
    });
    timer.listen((event) => setState(() {
      time = event.hour.toString() + ':' + event.minute.toString();
    }));*/ 
    wetProvider = Provider.of<WeatherProvider>(context, listen: false);
    wetProvider!.getWeatherData(context);
    wetProvider!.getData(context, "aaaaaa");
    super.initState();
   

    
  }
 List<String> saatlikImage = List.generate(100, (index) => "assets/rain.png");
    List<int> saatlikHava = [
      18,
      19,
      20,
      17,
    ];
    List<String> saat = ["4.00", "5.00", "6.00", "7.00"];

    List<String> gunImage = [
      "assets/sun2.png",
      "assets/rain.png",
      "assets/snow.png",
    ];
    List<String> gun = [
      "Pazartesi",
      "Salı",
      "Çarşamba",
    ];
    List<int> gunDerece = [
      18,
      19,
      20,
    ];
    List<String> gunDurum = [
      "Güneş",
      "Yağmur",
      "Kar",
    ];
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 35,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(
                  location: 'Türkiye, Ankara',
                ),
                Consumer(builder: (context, WeatherProvider value, child) {
                  if (value.isLoading == false) {
                    value.refreshDate;
                    return WeatherInfo(
                      date:
                          "${DateFormat("EEEE").format(DateTime.now())}, ${DateFormat('dd-MM-yyyy').format(DateTime.now())}",
                      //time: '$time',
                      time: '${value.hourmin}',
                      weatherImage: 'assets/rain.png',
                      tempature: value.response.main!.temp!,
                      forecast: '${value.response.weather![0].main}',
                      update:
                          'Son Güncelleme ${DateFormat("kk:mm a").format(DateTime.now())}',
                    );
                  }
                  else{
                    value.refreshDate;
                  }
                  return Text("hata");
                }),
                Container(
                    margin: EdgeInsets.only(top: 3.h),
                    child: Text(
                      "Saatlik Hava Durumu",
                      style: Constant.saatlikStyle,
                    )),
                Consumer(builder: (context, WeatherProvider value, child) {
                  return value.isLoadingFive? CircularProgressIndicator():Container(
                    height: 15.1.h,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.wresponse.list!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(index: index,),));
                          },
                          child: HourlyWeather(
                            image: saatlikImage[index],
                            hourlyTempature: value.wresponse.list![index].main!.temp!.toDouble(),
                            saat: value.wresponse.list![index].dtTxt.toString().split(" ").last.toString().substring(0,5),
                          ),
                        );
                      },
                    ),
                  );
                },
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Text(
                  "Günlük",
                  style: Constant.saatlikStyle,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Information(
                  bildirim1: 'Yağmurlu',
                  bildirim2: 'Yağmurlu',
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Container(
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: gunImage.length,
                    itemBuilder: (context, index) {
                      return DaysWeather(
                          image: gunImage[index],
                          gun: gun[index],
                          derece: gunDerece[index],
                          durum: gunDurum[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
