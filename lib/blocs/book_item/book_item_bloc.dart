import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';

part 'book_item_event.dart';
part 'book_item_state.dart';

class BookItemBloc extends Bloc<BookItemEvent, BookItemState> {
  final Book book;
  User user;
  Requests req = new Requests();
  BookItemBloc({@required this.book, @required this.user});
  @override
  BookItemState get initialState => BookItemInitial();

  @override
  Stream<BookItemState> mapEventToState(
    BookItemEvent event,
  ) async* {
    if (event is AddToFavorite) {
      yield BookItemLoading(caption: "Добавляем книгу в избранное...");
      await req.markBook(token: user.token, id: book.id);
      yield BookItemInitial(
        faved: true,
      );
    }
    if (event is RemFromFavorite) {
      yield BookItemLoading(caption: "Удаляем книгу из избранного...");
      await req.markBook(token: user.token, id: book.id);
      yield BookItemInitial(unfaved: true);
    }
    if (event is AddToRead) {
      yield BookItemLoading(caption: "Добавляем книгу в список прочитанных...");
      await req.addBookToWatched(token: user.token, id: book.id);
      yield BookItemInitial(added: true);
    }
  }
}
