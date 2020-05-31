import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:less_projects/UI/nav_bar.dart';

class RegistrationFormPage extends StatefulWidget {
  @override
  State createState() => new RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationFormPage> {
  final loginConReg = new TextEditingController();
  final passConReg = new TextEditingController();
  final emailConReg = new TextEditingController();
  final phoneConReg = new TextEditingController();

  bool isNameValidReg = true;
  bool isPassValidReg = true;
  bool isEmailValidReg = true;
  bool isPhoneValidReg = true;
  bool error = false;

  String caption = "Произошла ошибка. Повторите попытку позже.";
  String errLoginReg =
      'Допустимая длина логина: 3-16\nДопустымые символы: a-z A-Z - _';
  String errPassReg = 'Минимальная длина пароля - 6 символов';
  String errEmailReg =
      'Примеры корректного логина логина: test@mail.ru\n3fgh4gfh.dfgdf1@gmail.com и т.д';

  RegExp regExpLoginReg = new RegExp(r'^[a-zA-Z0-9.*]{3,16}$');
  RegExp regExpPassReg = new RegExp(r'^[a-zA-Z0-9.*]{6,16}$');
  RegExp regExpEmailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");

  bool passwordNoVisibleReg = true;

  @override
  Widget build(BuildContext context) {
    if (error)
      Future.delayed(Duration(seconds: 3)).then((_) => setState(() {
            error = false;
          }));
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new SafeArea(
        child: Center(
          child: new SingleChildScrollView(
              child: new Column(
            children: <Widget>[
              //New user icon
              if (error)
                Text(
                  caption,
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
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
                  child: new Column(
                    children: <Widget>[
                      //Login
                      new Container(
                          margin:
                              new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value) {
                              if (regExpLoginReg.hasMatch(value)) {
                                isNameValidReg = true;
                              } else if (value.isEmpty) {
                                isNameValidReg = false;
                              } else {
                                isNameValidReg = false;
                              }
                              setState(() {});
                            },
                            controller: loginConReg,
                            decoration: new InputDecoration(
                                icon: new Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.blueGrey[900],
                                ),
                                hintText: 'Введите логин',
                                labelText: 'Ваш логин',
                                errorText: isNameValidReg ? null : errLoginReg),
                            keyboardType: TextInputType.text,
                          )),
                      //Passsword
                      new Container(
                          margin:
                              new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value) {
                              if (regExpPassReg.hasMatch(value)) {
                                isPassValidReg = true;
                              } else if (value.isEmpty) {
                                isPassValidReg = false;
                              } else {
                                isPassValidReg = false;
                              }
                              setState(() {});
                            },
                            controller: passConReg,
                            obscureText: passwordNoVisibleReg,
                            decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordNoVisibleReg
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.blueGrey[900],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      passwordNoVisibleReg =
                                          !passwordNoVisibleReg;
                                    });
                                  },
                                ),
                                icon: new Icon(
                                  FontAwesomeIcons.key,
                                  color: Colors.blueGrey[900],
                                ),
                                hintText: 'Введите пароль',
                                labelText: 'Ваш пароль',
                                errorText: isPassValidReg ? null : errPassReg),
                            keyboardType: TextInputType.text,
                          )),
                      //Email adress
                      new Container(
                          margin:
                              new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value) {
                              if (regExpEmailReg.hasMatch(value)) {
                                isEmailValidReg = true;
                              } else if (value.isEmpty) {
                                isEmailValidReg = false;
                              } else {
                                isEmailValidReg = false;
                              }
                              setState(() {});
                            },
                            controller: emailConReg,
                            decoration: new InputDecoration(
                                icon: new Icon(
                                  Icons.alternate_email,
                                  color: Colors.blueGrey[900],
                                ),
                                hintText: 'Введите электронную почту',
                                labelText: 'Ваша электронная почта',
                                errorText:
                                    isEmailValidReg ? null : errEmailReg),
                            keyboardType: TextInputType.emailAddress,
                          )),
                      //Registration button
                      new Container(
                        margin: new EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                        child: new MaterialButton(
                          onPressed: () => //TODO: Прикрутить логин
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeWidget()),
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
                      //Back to login page
                      new Container(
                        margin: new EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 5.0),
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
          )),
        ),
      ),
    );
  }
}
