part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsMain extends FilmsState {
  final List<String> films;

  FilmsMain({@required this.films});
  @override
  List<Object> get props => [];
}

class FilmLoading extends FilmsState {
  final String caption;

  FilmLoading({this.caption});

  @override
  // TODO: implement props
  List<Object> get props => [caption];
}
