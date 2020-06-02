part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsMain extends FilmsState {
  final List<Film> films;

  FilmsMain({@required this.films});
  @override
  List<Object> get props => [films];
}

class FilmLoading extends FilmsState {
  final String caption;

  FilmLoading({this.caption});

  @override
  List<Object> get props => [caption];
}
class EmptyFilmList extends FilmsState{
  @override
  List<Object> get props => [];
}
