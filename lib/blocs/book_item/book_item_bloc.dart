import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_item_event.dart';
part 'book_item_state.dart';

class BookItemBloc extends Bloc<BookItemEvent, BookItemState> {
  @override
  BookItemState get initialState => BookItemInitial();

  @override
  Stream<BookItemState> mapEventToState(
    BookItemEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
