import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/test_films.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';

part 'films_event.dart';
part 'films_state.dart';

Requests req = new Requests();

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  List<Film> films = new List<Film>();
  User user;

  FilmsState get initialState => FilmLoading(
      caption: "Идёт загрузка списка книг...\n Пожалуйста, подождите");

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    {
      if (event is FirstLoadFilm) {
        this.user = event.user;
        await req.refreshFilms(token: user.token);
        try {
          films = await req.getFilms(token: user.token);
          yield FilmsMain(films: films);
        } on EndOfItems {
          yield EmptyFilmList();
        }
      }
      if (event is MoreFilms) {
        yield FilmLoading(
            caption: "Идёт обновление списка книг... \nПожалуйста, подождите");
        try {
          films = await req.getFilms(token: user.token);
          yield FilmsMain(films: films);
        } on EndOfItems {
          yield EmptyFilmList();
        } on NotAuthorized {
          this.user =
              await req.getToken(login: user.login, password: user.password);
          try {
            films = await req.getFilms(token: user.token);
            yield FilmsMain(films: films);
          } on EndOfItems {
            yield EmptyFilmList();
          }
        }
      }
      if (event is RefreshFilms) {
        try {
          await req.refreshFilms(token: user.token);
          films = await req.getFilms(token: user.token);
          yield FilmsMain(films: films);
        } on EndOfItems {
          yield EmptyFilmList();
        } on NotAuthorized {
          this.user =
              await req.getToken(login: user.login, password: user.password);
          try {
            await req.refreshFilms(token: user.token);
            films = await req.getFilms(token: user.token);
            yield FilmsMain(films: films);
          } on EndOfItems {
            yield EmptyFilmList();
          }
        }
      }
    }
  }
}
