import 'package:auth_bloc_hive/services/auth.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _auth;

  LoginBloc(this._auth) : super(LoginInitial()) {
    on<SubmitLogin>((event, emit) async {
      if (formKey.currentState!.validate()) {
        final user = await _auth.authenticateUser(
          event.email,
          event.pass,
        );
        if (user != null) {
          emit(LoginSuccessful(user));
          emit(LoginInitial());
        }
      }
    });

    on<SubmitRegister>((event, emit) async {
      await _auth.init();

      emit(LoginInitial());
    });
  }

  final formKey = GlobalKey<FormState>();
}
