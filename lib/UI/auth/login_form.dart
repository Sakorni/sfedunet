import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/nav_bar.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/blocs/films/films_bloc.dart';
import 'package:less_projects/blocs/login/login_bloc.dart';
import 'package:less_projects/blocs/registry/registry_bloc.dart';
import 'register_form.dart';

/*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeWidget()),
                                  );*/

class LoginPage extends StatelessWidget {
  bool passwordNoVisible = true;
  TextEditingController _loginController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (context) => new SafeArea(
            child: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginInitial && state.failed)
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Не удалось войти в аккаунт. Пожалуйста, проверьте корректность данных и попробуйте снова"),
                ));
              if (state is LoginSuccess) {
                BlocProvider.of<BooksBloc>(context)
                    .add(FirstLoadBook(user: state.user));
                BlocProvider.of<FilmsBloc>(context)
                    .add(FirstLoadFilm(user: state.user));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeWidget()));
              }
            },
            builder: (context, state) {
              if (state is LoginLoading)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      state.caption,
                      style: new TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    CircularProgressIndicator(
                      strokeWidth: 5,
                    ),
                  ],
                );

              if (state is LoginInitial)
                return new SingleChildScrollView(
                  child: new Column(
                    children: <Widget>[
                      new Form(
                        child: new Theme(
                          data: new ThemeData(
                            brightness: Brightness.dark,
                            primarySwatch: Colors.teal,
                          ),
                          child: new Column(
                            children: <Widget>[
                              new Text('Ля, просто нажми "Войти" и всё.',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800)),
                              SizedBox(height: 20),
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: new TextFormField(
                                  controller: _loginController,
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      FontAwesomeIcons.user,
                                      color: Colors.blueGrey[900],
                                    ),
                                    hintText: 'Введите ваш логин',
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 20.0),
                                child: new TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      FontAwesomeIcons.key,
                                      color: Colors.blueGrey[900],
                                    ),
                                    hintText: 'Введите пароль',
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                              ),
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    50.0, 10.0, 50.0, 20.0),
                                child: new MaterialButton(
                                  onPressed: () =>
                                      BlocProvider.of<LoginBloc>(context).add(
                                          CheckLogin(
                                              login: _loginController.text,
                                              password:
                                                  _passwordController.text)),
                                  color: Colors.blueGrey[800],
                                  textColor: Colors.white,
                                  child: new Text(
                                    'Войти',
                                  ),
                                  height: 50.0,
                                  minWidth: 200.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    50.0, 0.0, 50.0, 20.0),
                                child: new MaterialButton(
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<RegistryBloc>(
                                        create: (context) => RegistryBloc(),
                                        child: RegistrationFormPage(),
                                      ),
                                    ),
                                  ),
                                  color: Colors.blueGrey[800],
                                  textColor: Colors.white,
                                  child: new Text('Зарегистрироваться'),
                                  height: 50.0,
                                  minWidth: 200.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            },
          ),
        )),
      ),
    );
  }
}
