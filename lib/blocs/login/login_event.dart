part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class FirstLoadingLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class CheckLogin extends LoginEvent {
  final String login;
  final String password;
  CheckLogin({@required this.login, @required this.password});
  @override
  List<Object> get props => [login, password];
}

class Exit extends LoginEvent {
  @override
  List<Object> get props => [];
}
