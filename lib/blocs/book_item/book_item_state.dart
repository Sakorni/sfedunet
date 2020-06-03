part of 'book_item_bloc.dart';

abstract class BookItemState extends Equatable {
  const BookItemState();
}

class BookItemInitial extends BookItemState {
  final bool faved;
  final bool unfaved;
  final bool added;

  BookItemInitial(
      {this.added = false, this.faved = false, this.unfaved = false});
  @override
  List<Object> get props => [added, faved, unfaved];
}

class BookItemLoading extends BookItemState {
  final String caption;

  BookItemLoading({this.caption});
  @override
  List<Object> get props => [caption];
}
