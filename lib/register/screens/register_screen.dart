import 'package:auth_bloc_hive/login/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: _Register(),
        ),
      ),
    );
  }
}

class _Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          width: 160,
          child: Container(
            margin: const EdgeInsets.only(top: 30, bottom: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  "assets/register/register.jpg",
                ),
                scale: 35,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Text(
          "Create your account",
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          maxLength: 20,
          decoration: const InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Colors.blueGrey,
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
            helperText: "What's your name?",
          ),
          onChanged: (value) {},
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
        const SizedBox(height: 20),
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
        _register(context),
        _login(context),
      ],
    );
  }

  Widget _register(BuildContext context) {
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
            builder: (_) => const RegisterScreen(),
          ),
        );
      },
      child: const Text("Register"),
    );
  }

  Widget _login(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account?'),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
            );
          },
          child: const Text("Login"),
        ),
      ],
    );
  }
}
