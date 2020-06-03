part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsMain extends FilmsState {
  final List<Film> films;
  final bool showFav;

  FilmsMain({@required this.films, this.showFav = false});
  @override
  List<Object> get props => [films];
}

class FilmLoading extends FilmsState {
  final String caption;

  FilmLoading({this.caption});

  @override
  List<Object> get props => [caption];
}

class EmptyFilmList extends FilmsState {
  @override
  List<Object> get props => [];
}

class EmptyFavFilmList extends FilmsState {
  @override
  List<Object> get props => [];
}
