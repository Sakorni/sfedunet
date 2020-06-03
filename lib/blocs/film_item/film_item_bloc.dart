import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';

part 'film_item_event.dart';
part 'film_item_state.dart';

class FilmItemBloc extends Bloc<FilmItemEvent, FilmItemState> {
  final Film film;
  User user;
  Requests req = new Requests();

  FilmItemBloc({@required this.film, @required this.user});
  @override
  FilmItemState get initialState => FilmItemInitial();

  @override
  Stream<FilmItemState> mapEventToState(
    FilmItemEvent event,
  ) async* {
    if (event is AddToFavorite) {
      yield FilmItemLoading(caption: "Добавляем фильм в избранное...");
      await req.markFilm(token: user.token, id: film.id);
      yield FilmItemInitial(added: true);
    }
    if (event is AddToRead) {
      yield FilmItemLoading(
          caption: "Добавляем фильм в список просмотренных...");
      await req.addFilmToWatched(token: user.token, id: film.id);
      yield FilmItemInitial(added: true);
    }
  }
}
