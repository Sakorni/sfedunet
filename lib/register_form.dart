import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegistrationFormPage extends StatefulWidget {
  @override
  State createState() => new RegistrationFormState();
}

class RegistrationFormState extends State<RegistrationFormPage>{
  final loginConReg = new TextEditingController();
  final passConReg = new TextEditingController();
  final emailConReg = new TextEditingController();
  final phoneConReg = new TextEditingController();

  bool isNameValidReg = true;
  bool isPassValidReg = true;
  bool isEmailValidReg = true;
  bool isPhoneValidReg = true;

  String errLoginReg = 'Допустимая длина логина: 3-16\nДопустымые символы: a-z A-Z - _';
  String errPassReg = 'Минимальная длина пароля: 8\nКак минимум одна заглавная буква,\nодна строчная буква,\nодна цифра\nи один специальный символ';
  String errEmailReg = 'Примеры корректного логина логина: test@mail.ru\n3fgh4gfh.dfgdf1@gmail.com и т.д';
  String errPhoneReg = 'Примеры корректных номеров толефона:\n89999999999\n+79999999999 и т.д';
  
  RegExp regExpLoginReg = new RegExp(r'^[a-zA-Z0-9_-]{3,16}$');
  RegExp regExpPassReg = new RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  RegExp regExpEmailReg = new RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
  RegExp regExpPhoneReg = new RegExp(r'^((\+7|8)+([0-9]){10})$');
  
  bool passwordNoVisibleReg = true;
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new SafeArea(
        child: Center(
          child: new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                //New user icon
                new Container(
                  margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                  width: 100.0,
                  height: 100.0,
                  child: new Image(
                    image: AssetImage('images/add_user.png'),
                  ),
                ),
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
                          margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value){
                              if(regExpLoginReg.hasMatch(value)){
                                isNameValidReg = true;
                              }else if(value.isEmpty){
                                isNameValidReg = false;
                              }
                              else{
                                isNameValidReg = false;
                              }
                              setState(() {

                              });
                            },
                            controller: loginConReg,
                            decoration: new InputDecoration(
                              icon: new Icon(FontAwesomeIcons.user, color: Colors.blueGrey[900],),
                              hintText: 'Введите логин',
                              labelText: 'Ваш логин',
                              errorText: isNameValidReg ? null : errLoginReg
                            ),
                            keyboardType: TextInputType.text,
                          )
                        ),
                        //Passsword
                        new Container(
                          margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value){
                              if(regExpPassReg.hasMatch(value)){
                                isPassValidReg = true;
                              }else if(value.isEmpty){
                                isPassValidReg = false;
                              }
                              else{
                                isPassValidReg = false;
                              }
                              setState(() {

                              });
                            },
                            controller: passConReg,
                            obscureText: passwordNoVisibleReg,
                            decoration: new InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordNoVisibleReg ? Icons.visibility_off: Icons.visibility,
                                  color: Colors.blueGrey[900],
                                ),
                                onPressed: (){
                                  setState(() {
                                    passwordNoVisibleReg = !passwordNoVisibleReg;
                                  });
                                },
                              ),
                              icon: new Icon(FontAwesomeIcons.key, color: Colors.blueGrey[900],),
                              hintText: 'Введите пароль',
                              labelText: 'Ваш пароль',
                              errorText: isPassValidReg ? null: errPassReg
                            ),
                            keyboardType: TextInputType.text,
                          )
                        ),
                        //Email adress
                        new Container(
                          margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                          child: new TextFormField(
                            onChanged: (value){
                              if(regExpEmailReg.hasMatch(value)){
                                isEmailValidReg = true;
                              }else if(value.isEmpty){
                                isEmailValidReg = false;
                              }
                              else{
                                isEmailValidReg = false;
                              }
                              setState(() {

                              });
                            },
                            controller: emailConReg,
                            decoration: new InputDecoration(
                              icon: new Icon(Icons.alternate_email, color: Colors.blueGrey[900],),
                              hintText: 'Введите электронную почту',
                              labelText: 'Ваша электронная почта',
                              errorText: isEmailValidReg ? null : errEmailReg
                            ),
                            keyboardType: TextInputType.emailAddress,
                          )
                        ),
                        //Phone number
                        new Container(
                          margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                          child: new TextFormField(
                            onChanged: (value){
                              if(regExpPhoneReg.hasMatch(value)){
                                isPhoneValidReg = true;
                              }else if(value.isEmpty){
                                isPhoneValidReg = false;
                              }
                              else{
                                isPhoneValidReg = false;
                              }
                              setState(() {

                              });
                            },
                            controller: phoneConReg,
                            decoration: new InputDecoration(
                              icon: new Icon(FontAwesomeIcons.phone, color: Colors.blueGrey[900],),
                              hintText: 'Введите номер телефона',
                              labelText: 'Номер телефона',
                              errorText: isPhoneValidReg ? null: errPhoneReg
                            ),
                            keyboardType: TextInputType.phone,
                          )
                        ),
                        //Registration button
                        new Container(
                            margin: new EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                            child: new MaterialButton(
                              onPressed: () => {},
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
                              onPressed: () => {
                                Navigator.pop(context)
                              },
                              color: Colors.blueGrey[800],
                              textColor: Colors.white,
                              child: new Text('Назад',),
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
            )
          ),
        ),
      ),
    );
  }
}