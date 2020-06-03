import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:less_projects/UI/test_book.dart';
import 'package:less_projects/classes/book_and_film.dart';
import 'package:less_projects/classes/requests.dart';
import 'package:less_projects/classes/user.dart';

part 'books_event.dart';
part 'books_state.dart';

Requests req = new Requests();

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  List<Book> books = new List<Book>();
  User user;
  bool favorite = false;

  @override
  BooksState get initialState => BooksLoading(
      caption: "Идёт загрузка списка книг...\n Пожалуйста, подождите");

  void setUser(User user) {
    this.user = user;
  }

  void changeFavorite() {
    this.favorite = !this.favorite;
  }

  @override
  Stream<BooksState> mapEventToState(
    BooksEvent event,
  ) async* {
    if (event is FirstLoadBook) {
      await Future.delayed(Duration(seconds: 1, milliseconds: 50));
      this.user = event.user;
      await req.refreshBooks(token: user.token);
      try {
        books = await req.getBooks(token: user.token);
        yield BooksMain(books: books);
      } on EndOfItems {
        yield EmptyBookList();
      }
    }
    if (event is MoreBooks) {
      yield BooksLoading(
          caption: "Идёт обновление списка книг... \nПожалуйста, подождите");
      await Future.delayed(Duration(seconds: 1));
      try {
        books = await req.getBooks(token: user.token);
        yield BooksMain(books: books);
      } on EndOfItems {
        yield EmptyBookList();
      } on NotAuthorized {
        this.user =
            await req.getToken(login: user.login, password: user.password);
        try {
          books = await req.getBooks(token: user.token);
          yield BooksMain(books: books);
        } on EndOfItems {
          yield EmptyBookList();
        }
      }
    }
    if (event is RefreshBooks) {
      try {
        await req.refreshBooks(token: user.token);
        books = await req.getBooks(token: user.token);
        yield BooksMain(books: books);
      } on EndOfItems {
        yield EmptyBookList();
      } on NotAuthorized {
        this.user =
            await req.getToken(login: user.login, password: user.password);
        try {
          await req.refreshBooks(token: user.token);
          books = await req.getBooks(token: user.token);
          yield BooksMain(books: books);
        } on EndOfItems {
          yield EmptyBookList();
        }
      }
    }
    if (event is ShowFavoritesBooks) {
      yield BooksLoading(
          caption: "Загрузка избранных книг... \nПожалуйста, подождите");
      try {
        books = await req.getFavBooks(token: user.token);
        yield BooksMain(books: books);
      } on EndOfItems {
        yield EmptyFavBookList();
      } on NotAuthorized {
        this.user =
            await req.getToken(login: user.login, password: user.password);
        try {
          books = await req.getFavBooks(token: user.token);
          yield BooksMain(books: books);
        } on EndOfItems {
          yield EmptyFavBookList();
        }
      }
    }
  }
}
