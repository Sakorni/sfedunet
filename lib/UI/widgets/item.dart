import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final bool isBook;
  final double height;
  final double width;
  final AssetImage image;
  final String name;

  const Item(
      {Key key,
      @required this.image,
      @required this.name,
      @required this.width,
      @required this.height,
      @required this.isBook})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
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
    );
  }
}
