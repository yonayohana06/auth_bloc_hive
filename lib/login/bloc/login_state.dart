part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessful extends LoginState {
  final String email;

  LoginSuccessful(this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class LoginFailed extends LoginState {
  final String? error;

  LoginFailed({this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
