import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'film_item_event.dart';
part 'film_item_state.dart';

class FilmItemBloc extends Bloc<FilmItemEvent, FilmItemState> {
  @override
  FilmItemState get initialState => FilmItemInitial();

  @override
  Stream<FilmItemState> mapEventToState(
    FilmItemEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
