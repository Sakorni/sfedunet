part of 'book_item_bloc.dart';

abstract class BookItemState extends Equatable {
  const BookItemState();
}

class BookItemInitial extends BookItemState {
  final bool added;

  BookItemInitial({this.added = false});
  @override
  List<Object> get props => [];
}

class BookItemLoading extends BookItemState {
  final String caption;

  BookItemLoading({this.caption});
  @override
  List<Object> get props => [caption];
}
