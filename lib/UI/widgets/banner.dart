import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/auth/login_form.dart';
import 'package:less_projects/UI/style/decoration.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/blocs/films/films_bloc.dart';
import 'package:less_projects/blocs/login/login_bloc.dart';

class MyBanner extends StatelessWidget {
  final String caption;
  final bool book;

  MyBanner({Key key, @required this.caption, @required this.book})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksBloc bookBloc = BlocProvider.of<BooksBloc>(context);
    FilmsBloc filmBloc = BlocProvider.of<FilmsBloc>(context);
    bool favoriteBook = bookBloc.favorite;
    bool favoriteFilm = filmBloc.favorite;
    bool favorite = (book && favoriteBook) || (!book && favoriteFilm);
    print("fav is $favorite");
    print("favbook is $favoriteBook");
    return CustomPaint(
      painter: LinePainter(),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    iconSize: MediaQuery.of(context).size.height * 0.06,
                    icon: Icon(
                      !favorite ? Icons.bookmark_border : Icons.bookmark,
                      color: buttonColor,
                    ),
                    onPressed: () {
                      if (!book) {
                        filmBloc.changeFavorite();
                        if (favorite) {
                          filmBloc.add(MoreFilms());
                        } else {
                          filmBloc.add(ShowFavoritesFilms());
                        }
                      }
                      if (book) {
                        bookBloc.changeFavorite();
                        if (favorite) {
                          print("there");
                          bookBloc.add(MoreBooks());
                        } else {
                          bookBloc.add(ShowFavoritesBooks());
                        }
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  caption,
                  // style: Theme.of(context).textTheme.headline6,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  iconSize: MediaQuery.of(context).size.height * 0.05,
                  icon: Icon(
                    Icons.exit_to_app,
                    color: buttonColor,
                  ),
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context).add(Exit());
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
