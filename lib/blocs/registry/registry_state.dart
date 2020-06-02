part of 'registry_bloc.dart';

abstract class RegistryState extends Equatable {
  const RegistryState();
}

class RegistryInitial extends RegistryState {
  final bool failed;

  RegistryInitial({this.failed = false});
  @override
  List<Object> get props => [failed];
}

class RegistryLoading extends RegistryState {
  final String caption;
  RegistryLoading({@required this.caption});
  @override
  List<Object> get props => [caption];
}

class RegistrySuccess extends RegistryState {
  final User user;
  RegistrySuccess({this.user});
  @override
  List<Object> get props => [user];
}
