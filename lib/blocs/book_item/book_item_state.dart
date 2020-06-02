part of 'book_item_bloc.dart';

abstract class BookItemState extends Equatable {
  const BookItemState();
}

class BookItemInitial extends BookItemState {
  final bool added;
  final Book book;

  BookItemInitial({this.added = false, this.book});
  @override
  List<Object> get props => [];
}

class BookItemLoading extends BookItemState {
  final String caption;

  BookItemLoading({this.caption});
  @override
  List<Object> get props => [caption];
}
