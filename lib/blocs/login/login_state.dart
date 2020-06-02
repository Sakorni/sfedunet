part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  final bool failed;

  LoginInitial({this.failed = false});

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  final String caption;
  LoginLoading({@required this.caption});
  @override
  List<Object> get props => [caption];
}

class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess({this.user});
  @override
  List<Object> get props => [user];
}
