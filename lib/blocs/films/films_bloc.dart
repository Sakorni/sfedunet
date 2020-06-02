import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';

part 'films_event.dart';
part 'films_state.dart';

Requests req = new Requests();

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  List<Film> films = new List<Film>();
  User user;
  bool favorite = false;

  FilmsState get initialState => FilmLoading(
      caption: "Идёт загрузка списка фильмов...\n Пожалуйста, подождите");
  void changeFavorite() {
    this.favorite = !this.favorite;
  }

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    {
      if (event is FirstLoadFilm) {
        yield FilmLoading(
            caption: "Идёт загрузка списка фильмов... \nПожалуйста, подождите");
        await Future.delayed(Duration(seconds: 1, milliseconds: 50));
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
            caption:
                "Идёт обновление списка фильмов... \nПожалуйста, подождите");
        await Future.delayed(Duration(seconds: 1));
        try {
          print('trying');
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
        yield FilmLoading(
            caption:
                "Идёт обновление списка фильмов... \nПожалуйста, подождите");
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
      if (event is ShowFavoritesFilms) {
        yield FilmLoading(
            caption: "Загружаем избранные фильмы... \nПожалуйста, подождите");
        try {
          await req.refreshFilms(token: user.token);
          films = await req.getFavFilms(token: user.token);
          yield FilmsMain(films: films);
        } on EndOfItems {
          yield EmptyFavFilmList();
        } on NotAuthorized {
          this.user =
              await req.getToken(login: user.login, password: user.password);
          try {
            await req.refreshFilms(token: user.token);
            films = await req.getFavFilms(token: user.token);
            yield FilmsMain(films: films);
          } on EndOfItems {
            yield EmptyFilmList();
          }
        }
      }
    }
  }
}
