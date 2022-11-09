import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Information extends StatelessWidget {
  final String bildirim1;
  final String bildirim2;
  const Information({super.key, required this.bildirim1, required this.bildirim2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 13.h,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/arkaplan.png"),fit: BoxFit.contain)),
      child: Row(children: [
        SizedBox(width: 6.w,),
        Image.asset("assets/bildirim.png"),
        SizedBox(width: 6.w,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("$bildirim1", style: Constant.kalinStyle,),
          SizedBox(height: 1.h,),
          Text("$bildirim2", style: Constant.duzStyle,),
        ],)
      ],)
    );
  }
}