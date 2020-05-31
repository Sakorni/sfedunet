import 'package:flutter/material.dart';
import 'package:less_projects/classes/book_and_film.dart';

class Item extends StatelessWidget {
  final bool isBook;
  final double height;
  final double width;
  final AssetImage image;
  final String name;
  final InsideItem item;

  const Item(
      {Key key,
      @required this.image,
      @required this.name,
      @required this.width,
      @required this.height,
      @required this.isBook,
      this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0, top: 5.0),
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: image, fit: BoxFit.fill),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: FlatButton(
            child: new Container(),
            onPressed: () => print(
                "Clicked in $name\nheight:${this.height}\nweight:${this.height}"),
          ),
        ),
      ],
    );
  }
}