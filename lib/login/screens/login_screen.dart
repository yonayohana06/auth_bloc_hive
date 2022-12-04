import 'package:auth_bloc_hive/dashboard/home.dart';
import 'package:auth_bloc_hive/register/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: _LoginForm(),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
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
        TextFormField(
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
          onChanged: (value) {},
        ),
        const SizedBox(height: 25),
        TextFormField(
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
          onChanged: (value) {},
        ),
        const SizedBox(height: 30),
        _login(context),
        _register(context),
      ],
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
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
