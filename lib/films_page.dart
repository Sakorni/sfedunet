import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Films extends StatefulWidget {
  @override
  _FilmsState createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new SingleChildScrollView(
        child: new Column(
        children: <Widget>[
          new Container(
          margin: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
          // child: new Image(image: AssetImage('images/piraty_karibskogo_morya.jpg')),
          child: new ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: new Image(image: AssetImage('images/piraty_karibskogo_morya.jpg')),
              
            ),
        ),
          new Container(
            margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            // child: new Image(image: AssetImage('images/ZooTropolis.jpg')),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: new Image(image: AssetImage('images/ZooTropolis.jpg')),
            ),
          ),
          new Container(
            margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            // child: new Image(image: AssetImage('images/Avengers.webp')),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: new Image(image: AssetImage('images/Avengers.webp')),
            ),
          ),
        ],  
      ),
      ),
    );
  }
}
