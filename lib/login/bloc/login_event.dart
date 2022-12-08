part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SubmitLogin extends LoginEvent {
  final String email;
  final String pass;

  const SubmitLogin(this.email, this.pass);
  @override
  List<Object?> get props => [email, pass];
}

class SubmitRegister extends LoginEvent {
  @override
  List<Object?> get props => [];
}
