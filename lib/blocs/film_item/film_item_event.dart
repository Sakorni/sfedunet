part of 'film_item_bloc.dart';

abstract class FilmItemEvent extends Equatable {
  const FilmItemEvent();
}

class AddToFavorite extends FilmItemEvent {
  @override
  List<Object> get props => [];
}

class AddToRead extends FilmItemEvent {
  @override
  List<Object> get props => [];
}

class RemFromFavorite extends FilmItemEvent {
  @override
  List<Object> get props => [];
}
