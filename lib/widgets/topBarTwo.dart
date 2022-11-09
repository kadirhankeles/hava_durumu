import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hava_durumu/core/constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBarTwo extends StatelessWidget {
  final String location;
  const TopBarTwo({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.h),
      width: double.infinity,
      height: 4.5.h,
      //color: Colors.red,
      child: Padding(
        padding:  EdgeInsets.only(left: 2.h, right: 2.h ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //SizedBox(width: 2.h,),
            Icon(Icons.arrow_back_ios_new,color: Colors.white, size: 14,),
            Text("$location", style: Constant.dateStyle,),
            Icon(Icons.more_horiz_outlined, color: Colors.white,),
          ],
        ),
      ),
    );
  }
}