import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/UI/widgets/banner.dart';
import 'package:less_projects/UI/widgets/book_item.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/classes/book_and_film.dart';

class Books extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Кнопошка получения большего списка
    Widget getMore = Container(
      padding: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.2,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey[600],
        label: Text("Ещё!"),
        onPressed: () => BlocProvider.of<BooksBloc>(context).add(MoreBooks()),
      ),
    );

    ///Выдает наполнение основного экрана
    List<Widget> getListOfItems({List<Book> books, BuildContext context}) {
      double width = MediaQuery.of(context).size.width * 0.6;
      double height = MediaQuery.of(context).size.height * 0.4;
      List<Widget> result = new List<Widget>();
      result.add(MyBanner(caption: "Книги"));
      books.forEach((book) => result.add(
            new BookItem(
              height: height,
              width: width,
              item: book,
            ),
          ));
      result.add(getMore);
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
                if (state is BooksMain) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: getListOfItems(
                            books: state.books, context: context),
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
                            child: Text(state.caption,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
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
