import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/pages/film_item_page.dart';
import 'package:less_projects/blocs/film_item/film_item_bloc.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/user.dart';

class FilmItem extends StatelessWidget {
  final double height;
  final double width;
  final Film item;
  final User user;

  const FilmItem(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.item,
      @required this.user})
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
                builder: (context) => BlocProvider<FilmItemBloc>(
                  create: (context) => FilmItemBloc(film: item, user: user),
                  child: FilmItemPage(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
