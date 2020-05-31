part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();
}

class BooksInitial extends BooksState {
  @override
  List<Object> get props => [];
}
