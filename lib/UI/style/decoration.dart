import 'package:flutter/material.dart';

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
        Colors.deepPurple[200],
        Colors.deepPurple[100],
        Colors.deepPurple[100],
        Colors.deepPurple[200],
      ]));
}
