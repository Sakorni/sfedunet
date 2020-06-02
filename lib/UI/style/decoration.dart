import 'package:flutter/material.dart';

TextStyle style = new TextStyle(
    fontSize: 18, color: Color(0xFF644D9D), fontWeight: FontWeight.w600);
Color mainColor = Colors.deepPurple[100];
Color mainColor2 = Colors.deepPurple[200];
Color buttonColor = Color(0xFFE7CFFA);
BoxDecoration backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.mirror,
          stops: [
        0.0,
        0.4,
        0.6,
        1
      ],
          colors: [
        mainColor2,
        mainColor,
        mainColor,
        mainColor2,
      ]));
}
