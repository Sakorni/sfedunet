import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  @override
  BooksState get initialState => BooksInitial();

  @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
