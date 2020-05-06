import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  @override
  _BooksState createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              // child: new Image(image: AssetImage('images/1984.jpg')),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: new Image(image: AssetImage('images/1984.jpg')),
              ),
            ),
            new Container(
              margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: new Image(image: AssetImage('images/jack_london.jpg')),
              ),
            ),
            new Container(
              margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              // child: new Image(image: AssetImage('images/sherlok_holmse.jpg')),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child:
                    new Image(image: AssetImage('images/sherlok_holmse.jpg')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
