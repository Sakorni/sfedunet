import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/test_book.dart';
import 'package:less_projects/classes/book_and_film.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  List<Book> books = testBooks;
  int start = 0;
  int end = 4;
  @override
  BooksState get initialState => BooksMain(books: books.sublist(start, end));

  @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    if (event is FirstLoadBook) {
      yield BooksLoading(
          caption: "Идёт загрузка списка книг...\n Пожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      chageInt();
      yield BooksMain(books: books.sublist(start, end));
    }
    if (event is MoreBooks) {
      yield BooksLoading(
          caption: "Идёт обновление списка книг... \nПожалуйста, подождите");
      await Future.delayed(Duration(seconds: 3));
      chageInt();
      yield BooksMain(books: books.sublist(start, end));
    }
  }

  void chageInt() {
    if (end == books.length - 1) {
      start = 0;
      end = 4;
      return;
    } else {
      start = end;
      end >= books.length - 5 ? end = books.length - 1 : end += 4;
    }
  }
}
