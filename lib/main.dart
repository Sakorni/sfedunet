import 'package:flutter/material.dart';
import 'home_widget.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,//Убрать надпись Debug
      home: new HomeWidget(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}