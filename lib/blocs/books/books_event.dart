part of 'books_bloc.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class FirstLoadBook extends BooksEvent {
  final User user;

  FirstLoadBook({this.user});
  @override
  List<Object> get props => [user];
}

class MoreBooks extends BooksEvent {
  @override
  List<Object> get props => [];
}

class RefreshBooks extends BooksEvent {
  @override
  List<Object> get props => [];
}

class ShowFavoritesBooks extends BooksEvent {
  @override
  List<Object> get props => [];
}
