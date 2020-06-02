import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:less_projects/UI/pages/books_page.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/user.dart';

class Requests {
  static const URL = 'http://35.228.194.199:3000/';

  ///Регистрирует пользователя.
  Future<bool> reg(
      {@required String email,
      @required String login,
      @required String password}) async {
    bool isMail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (password.trim().length < 4 || !isMail || login.trim().length < 4)
      return false;
    String body = jsonEncode(<String, dynamic>{
      "user": {"email": email, "username": login, "password": password}
    });
    print(body);
    http.Response response = await http.post(URL + '/user',
        body: body,
        headers: <String, String>{'Content-Type': 'application/json'});
    return response.statusCode == 200; //200 = OK//250 - not OK
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
    if (response.statusCode == 401) throw new NotAuthorized();
    if (response.statusCode == 201)
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
    if (response.statusCode == 401) throw new NotAuthorized();
    print(response.statusCode);
    print(jsonDecode(response.body));
    //TODO: Доделать
  }

  ///Занесение книги в избранное
  Future<bool> markBook({@required String token, @required String id}) async {
    http.Response response = await http.get('$URL/books/$id/mark',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    return response.statusCode == 200;
  }

  ///Занесение фильма в избранное
  Future<bool> markFilm({@required String token, @required String id}) async {
    http.Response response = await http.get('$URL/films/$id/mark',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw NotAuthorized;
    return response.statusCode == 200;
  }
/*
  ///Удаление книги из избранного
  Future<bool> unmarkBook({@required String token, @required String id}) async {
    http.Response response = await http.delete('$URL/books/$id/unmark',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    return response.statusCode == 200;
  }

  ///Удаление фильма из избранного
  Future<bool> unmarkFilm({@required String token, @required String id}) async {
    http.Response response = await http.delete('$URL/films/$id/unmark',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    return response.statusCode == 200;
  }*/

  ///Получить список книг
  Future<List<Book>> getBooks({@required String token}) async {
    await refreshBooks(token: token);
    List<Book> result = new List<Book>();
    http.Response response = await http
        .get('$URL/books/', headers: {HttpHeaders.authorizationHeader: token});
    print(response.statusCode);
    if (response.statusCode == 401) throw new NotAuthorized();
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      list.forEach((data) {
        result.add(new Book.fromData(data));
      });
      return result;
    } else if (response.statusCode == 204)
      throw new EndOfItems();
    else
      throw new NetworkException();
  }

  ///Получить список книг
  Future<List<Film>> getFilms({@required String token}) async {
    List<Film> result = new List<Film>();
    http.Response response = await http
        .get('$URL/films/', headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      list.forEach((data) {
        result.add(new Film.fromData(data));
      });
      return result;
    } else if (response.statusCode == 204)
      throw new EndOfItems();
    else
      throw new NetworkException();
  }

  ///Обновить список книг
  Future<void> refreshBooks({@required String token}) async {
    http.Response response = await http.get('$URL/books/refresh',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
  }

  ///Обновить список фильмов
  Future<void> refreshFilms({@required String token}) async {
    http.Response response = await http.get('$URL/films/refresh',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
  }

  ///Получить список избранных книг
  Future<List<Book>> getFavBooks({@required String token}) async {
    List<Book> result = new List<Book>();
    http.Response response = await http.get('$URL/books/favorites',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    if (response.statusCode == 204) throw new EndOfItems();
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      list.forEach((data) {
        result.add(new Book.fromData(data));
      });
      return result;
    } else
      throw new NetworkException();
  }

  ///Получить список избранных фильмов
  Future<List<Film>> getFavFilms({@required String token}) async {
    List<Film> result = new List<Film>();
    http.Response response = await http.get('$URL/films/favorites',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
    if (response.statusCode == 204) throw new EndOfItems();
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      list.forEach((data) {
        result.add(new Film.fromData(data));
      });
      return result;
    } else
      throw new NetworkException();
  }

  ///Добавляет книгу в список просмотренных
  Future<void> addBookToWatched(
      {@required String token, @required String id}) async {
    http.Response response = await http.get('$URL/books/id',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
  }

  ///Добавляет фильм с список просмотренных
  Future<void> addFilmToWatched(
      {@required String token, @required String id}) async {
    http.Response response = await http.get('$URL/films/id',
        headers: {HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 401) throw new NotAuthorized();
  }
}

class NetworkException implements Exception {}

class EndOfItems implements Exception {}

class NotAuthorized implements Exception {}
