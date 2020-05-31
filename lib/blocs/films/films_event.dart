part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();
}

class FirstLoadFilm extends FilmsEvent {
  @override
  List<Object> get props => [];
}

class MoreFilms extends FilmsEvent {
  @override
  List<Object> get props => [];
}
