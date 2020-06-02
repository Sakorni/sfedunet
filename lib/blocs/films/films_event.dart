part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();
}

class FirstLoadFilm extends FilmsEvent {
  final User user;

  FirstLoadFilm({this.user});
  @override
  List<Object> get props => [user];
}

class MoreFilms extends FilmsEvent {
  @override
  List<Object> get props => [];
}

class RefreshFilms extends FilmsEvent {
  @override
  List<Object> get props => [];
}

class ShowFavoritesFilms extends FilmsEvent {
  @override
  List<Object> get props => [];
}
