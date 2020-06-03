part of 'film_item_bloc.dart';

abstract class FilmItemState extends Equatable {
  const FilmItemState();
}

class FilmItemInitial extends FilmItemState {
  final bool faved;
  final bool unfaved;
  final bool added;

  FilmItemInitial(
      {this.added = false, this.faved = false, this.unfaved = false});
  @override
  List<Object> get props => [added, faved, unfaved];
}

class FilmItemLoading extends FilmItemState {
  final String caption;

  FilmItemLoading({this.caption});
  @override
  List<Object> get props => [caption];
}
