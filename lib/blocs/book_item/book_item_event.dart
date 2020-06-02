part of 'book_item_bloc.dart';

abstract class BookItemEvent extends Equatable {
  const BookItemEvent();
}

class AddToFavorite extends BookItemEvent {
  @override
  List<Object> get props => [];
}

class AddToRead extends BookItemEvent {
  @override
  List<Object> get props => [];
}
