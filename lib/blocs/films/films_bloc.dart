import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/test_films.dart';
import 'package:less_projects/classes/book_and_film.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  List<Film> films = testFilms;
  int start = 0;
  int end = 4;
  @override
  FilmsState get initialState => FilmsMain(films: films.sublist(start, end));

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    if (event is FirstLoadFilm) {
      yield FilmLoading(
          caption: "Идёт загрузка списка фильмов... \nПожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      chageInt();
      yield FilmsMain(films: films.sublist(start, end));
    }
    if (event is MoreFilms) {
      yield FilmLoading(
          caption: "Идёт обновление списка фильмов... \nПожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      chageInt();
      yield FilmsMain(films: films.sublist(start, end));
    }
  }

  ///Меняет значения Start и End
  void chageInt() {
    if (end == films.length - 1) {
      start = 0;
      end = 4;
      return;
    } else {
      start = end;
      end >= films.length - 5 ? end = films.length - 1 : end += 4;
    }
  }
}
