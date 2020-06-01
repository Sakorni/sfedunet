import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:less_projects/classes/user.dart';

class Requests {
  static const URL = 'http://109.172.68.223:3000';

  ///Регистрирует пользователя.
  Future<bool> reg(
      {@required String email,
      @required String login,
      @required String password}) async {
    print("password is $password");
    String body = jsonEncode(<String, dynamic>{
      "user": {"email": email, "username": login, "password": password}
    });
    print(body);
    http.Response response = await http.post(URL + '/user',
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    return response.statusCode == 200; //200 = OK//250 - not OK
    //TODO: Доделать
  }

  ///Получает токен данного пользователя.
  Future<User> getToken(
      {@required String login, @required String password}) async {
    String bodyLogin =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(login)
            ? "email"
            : "username";
    String body = jsonEncode(<String, dynamic>{
      "auth": {bodyLogin: login, "password": password}
    });
    http.Response response = await http.post(URL + '/user_token',
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    if (response.statusCode == 200)
      return new User(
          token: jsonDecode(response.body)["jwt"],
          login: login,
          password: password);
    else
      return null;
  }

  ///Получает пользователя по токену
  Future<void> getProfile({@required String token}) async {
    print("getting");
    http.Response response = await http
        .get(URL + "/user", headers: {HttpHeaders.authorizationHeader: token});
    print(response.statusCode);
    print(jsonDecode(response.body));
    //TODO: Доделать
  }
}
