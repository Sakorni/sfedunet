part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();
}

class FilmsInitial extends FilmsState {
  @override
  List<Object> get props => [];
}
