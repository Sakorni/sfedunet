import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  List<String> films = [
    'nachalo.webp',
    'ivan_vasilievich.webp',
    'avatar.webp',
    'temniy_ricar.webp',
    'matrix.webp',
    'strazi_galaktiki.webp',
    'valee.webp',
    'back_to_future.webp',
    'five_elem.webp',
    'deadpool.webp',
    'piraty_karibskogo_morya.jpg',
    'ZooTropolis.jpg',
    'Avengers.webp',
    'leon_king1.webp',
    'harry_1.webp',
    'briliantovaya_ruka.webp',
    'toy_story1.webp',
    'sherlok.webp',
    'fantasticheskiye_tvari_1.webp',
    'marsianin.webp',
    'odin_doma.webp',
    'hatico.webp',
    'golovolomka.webp',
    'malefisenta.webp',
    'cars.webp',
    'chudo.webp',
    'paddingtons_advanture.webp',
    'polosatiy_reys.webp',
    'prizrak.webp',
    '101_dalmatines.webp',
  ];
  int start;
  int end;
  FilmsBloc() {
    this.start = 0;
    this.end = 5;
  }
  @override
  FilmsState get initialState => FilmsMain(films: films.sublist(start, end));

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    if (event is FirstLoadFilm) {
      yield FilmLoading(
          caption: "Идёт загрузка списка фильмов... Пожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      yield FilmsMain(films: films.sublist(start, end));
      chageInt();
    }
    if (event is MoreFilms) {
      yield FilmLoading(
          caption: "Идёт обновление списка фильмов... Пожалуйста, подождите");
      await Future.delayed(Duration(seconds: 4));
      yield FilmsMain(films: films.sublist(start, end));
      chageInt();
    }
  }

  ///Меняет значения Start и End
  void chageInt() {
    if (end == films.length - 1) {
      start = 0;
      end = 5;
      return;
    } else {
      start = end;
      end >= films.length - 6 ? end = films.length - 1 : end += 5;
    }
  }
}
