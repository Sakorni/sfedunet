import 'package:flutter/material.dart';

BoxDecoration backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.mirror,
          stops: [
        0.0,
        0.4,
        0.6,
        1
      ],
          colors: [
        Colors.blueGrey[800],
        Colors.blueGrey[700],
        Colors.blueGrey[700],
        Colors.blueGrey[800],
      ]));
}
