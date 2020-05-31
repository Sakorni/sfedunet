part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();
}

class FirstLoadFilm extends FilmsEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
