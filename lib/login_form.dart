import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'register_form.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  final loginCon = new TextEditingController();
  final passCon = new TextEditingController();
  
  bool isNameValid = true;
  bool isPassValid = true;
  
  String errLogin = 'Допустимая длина логина: 3-16\nДопустымые символы: a-z A-Z - _';
  String errPass = 'Минимальная длина пароля: 8\nКак минимум одна заглавная буква,\nодна строчная буква,\nодна цифра\nи один специальный символ';
  
  RegExp regExpLogin = new RegExp(r'^[a-zA-Z0-9_-]{3,16}$');
  RegExp regExpPass = new RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  
  bool passwordNoVisible = true;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new SafeArea(
        child: new Center(
            child: new SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  new Container(
                    width: 100.0,
                    height: 100.0,
                      child: new Image(
                      image: AssetImage('images/social-media.png',),
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
                          new Container(
                            margin: new EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                            child: new TextFormField(
                              onChanged: (value){
                                if(regExpLogin.hasMatch(value)){
                                  isNameValid = true;
                                }else if(value.isEmpty){
                                  isNameValid = false;
                                }
                                else{
                                  isNameValid = false;
                                }
                                setState(() {
                                  
                                });
                              },
                              controller: loginCon,
                              decoration: new InputDecoration(
                                icon: new Icon(FontAwesomeIcons.user, color: Colors.blueGrey[900],),
                                hintText: 'Введите логин',
                                labelText: 'Ваш логин',
                                errorText: isNameValid ? null : errLogin
                            ),
                                keyboardType: TextInputType.text,
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                            child: new TextFormField(
                              onChanged: (value){
                                if(regExpPass.hasMatch(value)){
                                  isPassValid = true;
                                }else if(value.isEmpty){
                                  isPassValid = false;
                                }else{
                                  isPassValid = false;
                                }
                                setState(() {
                                  
                                });
                              },
                              controller: passCon,
                              obscureText: passwordNoVisible,
                              decoration: new InputDecoration(
                                suffixIcon: IconButton(
                                icon: Icon(
                                  passwordNoVisible ? Icons.visibility_off: Icons.visibility,
                                  color: Colors.blueGrey[900],
                                ),
                                onPressed: (){
                                  setState(() {
                                    passwordNoVisible = !passwordNoVisible;
                                  });
                                },
                              ),
                                icon: new Icon(FontAwesomeIcons.key, color: Colors.blueGrey[900],),
                                hintText: 'Введите пароль',
                                labelText: 'Ваш пароль',
                                errorText: isPassValid ? null: errPass
                            ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 20.0),
                            child: new MaterialButton(
                              onPressed: () => {},
                              color: Colors.blueGrey[800],
                              textColor: Colors.white,
                              child: new Text('Войти',),
                              height: 50.0,
                              minWidth: 200.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          new Container(
                            margin: new EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 20.0),
                            child: new MaterialButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegistrationFormPage()),
                                  )
                              },
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
            ),
          ),
        
          
      ),
    );
  }
}
