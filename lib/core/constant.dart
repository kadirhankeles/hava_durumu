import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant{
  static final TextStyle locationStyle = GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w600);
  static final TextStyle dateStyle = GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white);
  static final TextStyle tempatureStyle = GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white);
  static final TextStyle forecastStyle = GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white);
  static final TextStyle saatlikStyle = GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.bold);
  static final TextStyle kalinStyle = GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.bold);
  static final TextStyle duzStyle = GoogleFonts.quicksand(fontSize: 16, fontWeight: FontWeight.w400);
  static const Color startColor = Color(0xff4F7FFA);
  static const Color finishColor = Color(0xff335FD1);
  static const Gradient renkGecis = LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[
             Constant.startColor,
             Constant.finishColor,
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          );
  }