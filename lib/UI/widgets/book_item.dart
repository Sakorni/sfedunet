import 'package:flutter/material.dart';
import 'package:less_projects/UI/pages/book_item_page.dart';
import 'package:less_projects/classes/book_and_film.dart';

class BookItem extends StatelessWidget {
  final double height;
  final double width;
  final Book item;

  const BookItem(
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
            image: DecorationImage(image: item.image, fit: BoxFit.fill),
            border: Border.all(
              color: Colors.white,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: FlatButton(
            child: new Container(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookItemPage(
                  book: item,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
