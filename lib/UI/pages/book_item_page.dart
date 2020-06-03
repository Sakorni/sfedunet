import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/blocs/book_item/book_item_bloc.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItemPage extends StatelessWidget {
  final bool showfav;
  const BookItemPage({
    @required this.showfav,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BookItemBloc bookbloc = BlocProvider.of<BookItemBloc>(context);
    Book book = bookbloc.book;

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
    Widget backButton() {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
            backgroundColor: buttonColor,
            label: Text(
              "Назад",
              style: style,
            ),
            onPressed: () => Navigator.pop(context)),
      );
    }

    //Добавляет в избранное (Вау)
    Widget addToFavorites(BuildContext context) {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          heroTag: "htag1",
          backgroundColor: buttonColor,
          label: Text(showfav ? "Убрать из избранного" : "В избранное",
              style: style),
          onPressed: () =>
              bookbloc.add(!showfav ? AddToFavorite() : RemFromFavorite()),
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
          backgroundColor: buttonColor,
          label: Text("Уже прочитанно", style: style),
          onPressed: () => bookbloc.add(AddToRead()),
        ),
      );
    }

    //Стиль для текста текстового поля

    //Текстовое поле
    Widget field(String caption1, String caption2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Colors.black),
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
        padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
        child: FlatButton(
          onPressed: () async => await _launchURL(caption2, context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: Colors.black),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Перейти к источнику",
                    style: style.copyWith(
                      fontSize: 20,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    )),
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
              child: BlocConsumer<BookItemBloc, BookItemState>(
                listener: (context, state) {
                  if (state is BookItemInitial) {
                    if (state.added)
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text(
                              "Книга успешно добавлена в список прочитанных!"),
                        ),
                      );
                    if (state.faved)
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Книга успешно добавлен в избранное!"),
                        ),
                      );
                    if (state.unfaved) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Книга успешно удалена из избранного!"),
                        ),
                      );
                    }
                  }
                },
                builder: (context, state) {
                  if (state is BookItemLoading) {
                    return Center(
                      heightFactor: 13,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            state.caption,
                            style: style,
                          ),
                          CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is BookItemInitial) {
                    return Padding(
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
                          backButton(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
