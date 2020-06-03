import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/pages/book_item_page.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/blocs/book_item/book_item_bloc.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/user.dart';

class BookItem extends StatelessWidget {
  final double height;
  final double width;
  final Book item;
  final User user;
  final bool fav;
  const BookItem(
      {Key key,
      @required this.fav,
      @required this.width,
      @required this.height,
      @required this.item,
      @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(item.name, style: style),
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
                builder: (context) => BlocProvider<BookItemBloc>(
                  create: (context) => BookItemBloc(book: item, user: user),
                  child: BookItemPage(
                    showfav: fav,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
