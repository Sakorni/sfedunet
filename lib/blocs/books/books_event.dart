part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class FirstLoadBook extends BooksEvent {
  @override
  List<Object> get props => [];
}

class MoreBooks extends BooksEvent {
  @override
  List<Object> get props => [];
}
