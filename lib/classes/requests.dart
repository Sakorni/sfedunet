import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Requests {
  String token;
  static const URL = 'http://109.172.68.223:3000';

  Future<void> reg(String email, String login, String password) async {
    String body = jsonEncode(
        <String, String>{"email": email, "login": login, "password": password});
    http.Response response = await http.post(URL + '/user',
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    //TODO: Доделать
  }

  Future<void> getProfile(
      String email, String login, String password, String token) async {
    String body = jsonEncode(
        <String, String>{"email": email, "login": login, "password": password});
    http.Response response = await http
        .get(URL + "/user", headers: {HttpHeaders.authorizationHeader: token});
    //TODO: Доделать
  }
}
