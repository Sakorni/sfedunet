import 'package:flutter/material.dart';
import 'package:less_projects/classes/book_and_film.dart';

class FilmItem extends StatelessWidget {
  final double height;
  final double width;
  final Film item;

  const FilmItem(
      {Key key, @required this.width, @required this.height, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          item.name,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0, top: 5.0),
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(item.picUrl), fit: BoxFit.fill),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: FlatButton(
            child: new Container(),
            onPressed: () => print(
                "Clicked in ${item.name}\nheight:${this.height}\nwidth:${this.width}"),
          ),
        ),
      ],
    );
  }
}
