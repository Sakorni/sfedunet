import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  @override
  FilmsState get initialState => FilmsInitial();

  @override
  Stream<FilmsState> mapEventToState(
    FilmsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
