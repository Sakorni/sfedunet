import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget{
  final Image bookImage;
  final double top;

  BookWidget({this.bookImage, this.top});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, top, 20.0, 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: bookImage,
      ),
    );
  }
}