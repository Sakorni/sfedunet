import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/UI/widgets/banner.dart';
import 'package:less_projects/UI/widgets/item.dart';
import 'package:less_projects/blocs/films/films_bloc.dart';

class Films extends StatelessWidget {
  @override
  //TODO: Добавить блокКонсумер
  Widget build(BuildContext context) {
    //Кнопошка получения большего списка
    Widget getMore = Container(
      padding: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.width * 0.2,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey[600],
        label: Text("Обновить список"),
        onPressed: () => BlocProvider.of<FilmsBloc>(context).add(MoreFilms()),
      ),
    );

    ///Выдает наполнение основного экрана
    List<Widget> getListOfItems({List<String> films, BuildContext context}) {
      double width = MediaQuery.of(context).size.width * 0.6;
      double height = MediaQuery.of(context).size.height * 0.4;
      List<Widget> result = new List<Widget>();
      result.add(MyBanner(caption: "Фильмы"));
      films.forEach((film) => result.add(
            new Item(
              height: height,
              width: width,
              name: film,
              isBook: false,
              image: AssetImage('images/' + film),
            ),
          ));
      result.add(getMore);
      return result;
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: backgroundGradient(),
            child: BlocConsumer<FilmsBloc, FilmsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is FilmsMain) {
                  return SingleChildScrollView(
                    child: Column(
                      children:
                          getListOfItems(films: state.films, context: context),
                    ),
                  );
                }
                if (state is FilmLoading) {
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
