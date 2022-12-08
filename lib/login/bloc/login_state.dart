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

  const LoginSuccessful(this.email);

  @override
  List<Object?> get props => [email];
}

class LoginFailed extends LoginState {
  final String? error;

  const LoginFailed({this.error});

  @override
  List<Object?> get props => [error];
}
