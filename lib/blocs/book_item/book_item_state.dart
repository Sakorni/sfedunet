part of 'book_item_bloc.dart';

abstract class BookItemState extends Equatable {
  const BookItemState();
}

class BookItemInitial extends BookItemState {
  @override
  List<Object> get props => [];
}
