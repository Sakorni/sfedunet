part of 'film_item_bloc.dart';

abstract class FilmItemState extends Equatable {
  const FilmItemState();
}

class FilmItemInitial extends FilmItemState {
  @override
  List<Object> get props => [];
}
