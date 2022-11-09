import 'package:flutter/material.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailSection extends StatelessWidget {
  final String image;
  final int deger;
  final String isaret;
  final String durum;
  const DetailSection({super.key, required this.image, required this.deger, required this.isaret, required this.durum});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 35.w,
      //margin: EdgeInsets.only(top: 1.h,),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(width: 3.h,),
          Image.asset(image,fit: BoxFit.cover,),
          SizedBox(width: 1.h,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$deger$isaret", style: Constant.kalinStyle,),
              Text("$durum", style: Constant.duzStyle,),

            ],
          )
        ],
      ),
    );
  }
}