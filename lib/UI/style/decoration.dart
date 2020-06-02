import 'package:flutter/material.dart';

Color mainColor = Colors.deepPurple[100];
Color mainColor2 = Colors.deepPurple[200];
Color buttonColor = Color(0xFFE7CFFA);
Color textColor = Color(0xFF644D9D);
TextStyle style =
    new TextStyle(fontSize: 18, color: textColor, fontWeight: FontWeight.w600);
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
