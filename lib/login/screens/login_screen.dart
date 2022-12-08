import 'package:auth_bloc_hive/dashboard/home.dart';
import 'package:auth_bloc_hive/login/bloc/login_bloc.dart';
import 'package:auth_bloc_hive/register/register.dart';
import 'package:auth_bloc_hive/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          RepositoryProvider.of<AuthService>(context),
        )..add(SubmitRegister()),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccessful) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
                if (state is LoginFailed) {
                  if (state.error != null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Login Failed'),
                        content: Text(state.error!),
                      ),
                    );
                  }
                }
              },
              builder: (context, state) {
                if (state is LoginInitial) {
                  return _LoginForm();
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60, bottom: 30),
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/login/login.png",
              ),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        ),
        const Text(
          "Login",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _formLogin(context),
      ],
    );
  }

  Widget _formLogin(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().formKey,
      child: Column(
        children: [
          TextFormField(
            controller: email,
            maxLength: 20,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              suffixIcon: Icon(
                Icons.email,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
              helperText: 'Enter your email address',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Enter a email';
              }
              if (text.length < 6) {
                return 'Too short';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: pass,
            maxLength: 20,
            obscureText: true,
            obscuringCharacter: '*',
            decoration: const InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
              helperText: 'Enter your password',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Enter a password';
              }
              if (text.length < 6) {
                return 'Too short';
              }
              return null;
            },
            onChanged: (value) {},
          ),
          const SizedBox(height: 30),
          _login(context),
          _register(context),
        ],
      ),
    );
  }

  Widget _login(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(106, 40),
      ),
      onPressed: () {
        context.read<LoginBloc>().add(SubmitLogin(email.text, pass.text));
      },
      child: const Text("Login"),
    );
  }

  Widget _register(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const RegisterScreen(),
              ),
            );
          },
          child: const Text("Register"),
        ),
      ],
    );
  }
}
