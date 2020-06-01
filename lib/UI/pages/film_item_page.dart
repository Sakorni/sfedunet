import 'package:flutter/material.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/classes/book_and_film.dart';

class FilmItemPage extends StatelessWidget {
  final Film film;

  const FilmItemPage({Key key, @required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget getMore = Container(
      padding: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.2,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.blueGrey[600],
          label: Text("Назад"),
          onPressed: () => Navigator.pop(context)),
    );

    TextStyle style = new TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    Widget field(String caption1, String caption2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.blueGrey[500]),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(caption1, style: style),
              Text(caption2, style: style),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: backgroundGradient(),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image(
                      fit: BoxFit.fill,
                      image: film.image,
                    ),
                  ),
                  field("Название: ", film.name),
                  field("Жанр: ", film.genre),
                  field("Режиссёр: ", film.director),
                  field("Возрастной рейтинг: ", film.rating),
                  field("Год выпуска: ", film.year),
                  field("Описание: ", film.caption),
                  field("В главных ролях: ", film.mainRoles.toString()),
                  FlatButton(
                      onPressed: () => print("SomeShit"),
                      child: field("Ссылка на просмотр: ", film.link)),
                  getMore,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*
Future<void> _launchURL(String url) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw new Exception();
  }
}*/
