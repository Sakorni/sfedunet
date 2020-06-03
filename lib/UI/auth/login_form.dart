import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/nav_bar.dart';
import 'package:less_projects/UI/style/decoration.dart';
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
      resizeToAvoidBottomInset: false,
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Builder(
          builder: (context) => new SafeArea(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment(0.0, -0.7),
                    child: new Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.47,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/whitelogo.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.5),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeWidget()));
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
                            child: new Form(
                              child: new Theme(
                                data: new ThemeData(
                                  brightness: Brightness.dark,
                                ),
                                child: new Column(
                                  children: <Widget>[
                                    new Container(
                                      margin: new EdgeInsets.fromLTRB(
                                          20.0, 0, 20.0, 20.0),
                                      child: new TextFormField(
                                        controller: _loginController,
                                        decoration: new InputDecoration(
                                          suffixIcon: new Icon(
                                            FontAwesomeIcons.user,
                                            color: buttonColor,
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
                                          suffixIcon: new Icon(
                                            FontAwesomeIcons.key,
                                            color: buttonColor,
                                          ),
                                          hintText: 'Введите пароль',
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: new Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        child: FloatingActionButton.extended(
                                          heroTag: "htag1",
                                          backgroundColor: buttonColor,
                                          label: Text("Войти", style: style),
                                          onPressed: () => BlocProvider.of<
                                                  LoginBloc>(context)
                                              .add(CheckLogin(
                                                  login: _loginController.text,
                                                  password: _passwordController
                                                      .text)),
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.14,
                                      child: FloatingActionButton.extended(
                                        heroTag: "htag2",
                                        backgroundColor: buttonColor,
                                        label: Text("Перейти к регистрации",
                                            style: style),
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider<RegistryBloc>(
                                              create: (context) =>
                                                  RegistryBloc(),
                                              child: RegistrationFormPage(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
