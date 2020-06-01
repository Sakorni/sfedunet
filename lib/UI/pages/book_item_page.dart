import 'package:flutter/material.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItemPage extends StatelessWidget {
  final Book book;

  const BookItemPage({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Открытие ссылки в браузере
    Future<void> _launchURL(String url, BuildContext context) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Не удалось открыть ссылку"),
          ),
        );
      }
    }

    //Кнопошка назад
    Widget backButton = Container(
      padding: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.2,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.blueGrey[600],
          label: Text("Назад"),
          onPressed: () => Navigator.pop(context)),
    );
    //Добавляет в избранное (Вау)
    Widget addToFavorites(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          heroTag: "htag1",
          backgroundColor: Colors.blueGrey[600],
          label: Text("В избранное"),
          onPressed: () => Scaffold.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Добавлено в избранное"),
            ),
          ),
        ),
      );
    }

    //Добавляет в список прочитанного
    Widget addToReadList(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          heroTag: "htag2",
          backgroundColor: Colors.blueGrey[600],
          label: Text("Уже просмотрено"),
          onPressed: () => Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: Text("Добавлено в список просмотренных"),
          )),
        ),
      );
    }

    //Стиль для текста текстового поля
    TextStyle style = new TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    //Текстовое поле
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

    Widget buttonField(String caption1, String caption2, BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: FlatButton(
          onPressed: () async => await _launchURL(caption2, context),
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
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Container(
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
                        image: book.image,
                      ),
                    ),
                    field("Название: ", book.name),
                    field("Автор: ", book.author),
                    field("Описание: ", book.info),
                    buttonField("Ссылка на книгу: ", book.link, context),
                    addToFavorites(context),
                    addToReadList(context),
                    backButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
