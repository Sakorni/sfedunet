import 'package:flutter/material.dart';

TextStyle style = new TextStyle(
    fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
Color mainColor = Colors.deepPurple[100];
Color mainColor2 = Colors.deepPurple[200];
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
