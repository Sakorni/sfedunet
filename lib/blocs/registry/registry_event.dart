part of 'registry_bloc.dart';

abstract class RegistryEvent extends Equatable {
  const RegistryEvent();
}

class FirstLoadingRegistry extends RegistryEvent {
  @override
  List<Object> get props => [];
}

class CheckRegistry extends RegistryEvent {
  final String login;
  final String email;
  final String password;
  CheckRegistry(
      {@required this.login, @required this.password, @required this.email});
  @override
  List<Object> get props => [login, password];
}
