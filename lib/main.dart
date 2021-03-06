import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:less_projects/UI/auth/login_form.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/blocs/films/films_bloc.dart';
import 'package:less_projects/blocs/login/login_bloc.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc()..add(FirstLoadingLogin()),
        ),
        BlocProvider<FilmsBloc>(create: (context) => FilmsBloc()),
        BlocProvider<BooksBloc>(create: (context) => BooksBloc()),
      ],
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginPage(),
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
            subtitle2: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 1),
          ),
          iconTheme: IconThemeData(color: Colors.white, size: 28),
          fontFamily: 'Roboto-Thin',
        ),
      ),
    );
  }
}
