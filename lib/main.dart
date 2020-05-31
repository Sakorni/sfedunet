import 'package:flutter/material.dart';
import 'package:less_projects/UI/auth/login_form.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false, //Убрать надпись Debug
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
          subtitle2: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              letterSpacing: 1),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 28),
        fontFamily: 'Roboto-Thin',
      ),
    );
  }
}
