import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:less_projects/UI/nav_bar.dart';
import 'package:less_projects/blocs/books/books_bloc.dart';
import 'package:less_projects/blocs/films/films_bloc.dart';
import 'package:less_projects/blocs/registry/registry_bloc.dart';

class RegistrationFormPage extends StatelessWidget {
  final _loginController = new TextEditingController();
  final _passController = new TextEditingController();
  final _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (context) => new SafeArea(
          child: Center(
              child: BlocConsumer<RegistryBloc, RegistryState>(
            listener: (context, state) {
              if (state is RegistryInitial && state.failed)
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Не удалось войти в аккаунт. Пожалуйста, проверьте корректность данных и попробуйте снова"),
                ));
              if (state is RegistrySuccess) {
                BlocProvider.of<BooksBloc>(context)
                    .add(FirstLoadBook(user: state.user));
                BlocProvider.of<FilmsBloc>(context)
                    .add(FirstLoadFilm(user: state.user));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeWidget()));
              }
            },
            builder: (context, state) {
              if (state is RegistryLoading)
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
              if (state is RegistryInitial)
                return new SingleChildScrollView(
                    child: new Column(
                  children: <Widget>[
                    new Text('Красиво, правда?\nНет?\nНу и хуй с ним.',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2.0)),
                    SizedBox(height: 20),
                    new Form(
                      child: new Theme(
                        data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                        ),
                        //Loginfield
                        child: new Column(
                          children: <Widget>[
                            new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 10.0),
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
                                )),
                            //Email adress
                            new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 10.0),
                                child: new TextFormField(
                                  controller: _emailController,
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      Icons.alternate_email,
                                      color: Colors.blueGrey[900],
                                    ),
                                    hintText: 'Введите электронную почту',
                                    labelText: 'Ваша электронная почта',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                )),
                            //Passsword
                            new Container(
                                margin: new EdgeInsets.fromLTRB(
                                    20.0, 0.0, 20.0, 10.0),
                                child: new TextFormField(
                                  controller: _passController,
                                  obscureText: true,
                                  decoration: new InputDecoration(
                                    icon: new Icon(
                                      FontAwesomeIcons.key,
                                      color: Colors.blueGrey[900],
                                    ),
                                    hintText: 'Введите пароль',
                                    labelText: 'Ваш пароль',
                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                )),

                            //Registration button
                            new Container(
                              margin: new EdgeInsets.fromLTRB(
                                  50.0, 10.0, 50.0, 10.0),
                              child: new MaterialButton(
                                onPressed: () =>
                                    BlocProvider.of<RegistryBloc>(context).add(
                                        CheckRegistry(
                                            email: _emailController.text,
                                            login: _loginController.text,
                                            password: _passController.text)),
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
                            //Back to login page
                            new Container(
                              margin: new EdgeInsets.fromLTRB(
                                  50.0, 10.0, 50.0, 5.0),
                              child: new MaterialButton(
                                onPressed: () => {Navigator.pop(context)},
                                color: Colors.blueGrey[800],
                                textColor: Colors.white,
                                child: new Text(
                                  'Назад',
                                ),
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
                    )
                  ],
                ));
            },
          )),
        ),
      ),
    );
  }
}
