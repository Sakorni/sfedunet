import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/UI/widgets/banner.dart';
import 'package:less_projects/UI/widgets/book_item.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/user.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = BlocProvider.of<BooksBloc>(context).user;
    //Кнопошка получения большего списка
    Widget getMore() {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          heroTag: "btn1",
          backgroundColor: mainColor,
          label: Text(
            "Ещё!",
            style: style,
          ),
          onPressed: () => BlocProvider.of<BooksBloc>(context).add(MoreBooks()),
        ),
      );
    }

    Widget refresh() {
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.2,
        child: FloatingActionButton.extended(
          heroTag: "btn2",
          backgroundColor: mainColor,
          label: Text(
            "Обновить",
            style: style,
          ),
          onPressed: () =>
              BlocProvider.of<BooksBloc>(context).add(RefreshBooks()),
        ),
      );
    }

    ///Выдает наполнение основного экрана
    List<Widget> getListOfItems({
      List<Book> books,
      BuildContext context,
    }) {
      double width = MediaQuery.of(context).size.width * 0.6;
      double height = MediaQuery.of(context).size.height * 0.4;
      List<Widget> result = new List<Widget>();
      result.add(MyBanner(caption: "Книги"));
      books.forEach((book) => result.add(
            new BookItem(
              user: user,
              height: height,
              width: width,
              item: book,
            ),
          ));
      result.add(getMore());
      return result;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: backgroundGradient(),
            child: BlocConsumer<BooksBloc, BooksState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is EmptyBookList)
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Ой, кажется, вы всё просмотрели!",
                              style: style,
                            ),
                          ),
                          refresh(),
                        ],
                      ),
                    ),
                  );
                if (state is BooksMain) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: getListOfItems(
                          books: state.books,
                          context: context,
                        ),
                      ),
                    ),
                  );
                }
                if (state is BooksLoading) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              state.caption,
                              style: style,
                            ),
                          ),
                          CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(child: Text("Что-то точно пошло не так..."));
              },
            )),
      ),
    );
  }
}
