import 'package:flutter/material.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBar extends StatelessWidget {
  final String location;
  const TopBar({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2.h),
      child: Row(
        children: [
          Image.asset("assets/location.png"),
          SizedBox(width: 1.w,),
          Text("$location", style: Constant.locationStyle,),
          SizedBox(width: 1.w,),
          Icon(Icons.arrow_drop_down),
          SizedBox(width: 47.w,),
          InkWell(
            borderRadius: BorderRadius.circular(20),
            radius: 30,
            onTap: () {
              
            },
            child: Image.asset("assets/search.png")),
        ],
      ),
    );
  }
}
