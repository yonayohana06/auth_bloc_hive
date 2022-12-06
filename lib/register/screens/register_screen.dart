import 'package:auth_bloc_hive/boxes/boxes.dart';
import 'package:auth_bloc_hive/dashboard/home.dart';
import 'package:auth_bloc_hive/login/login.dart';
import 'package:auth_bloc_hive/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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

class _Register extends StatefulWidget {
  @override
  State<_Register> createState() => _RegisterState();
}

class _RegisterState extends State<_Register> {
  final formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
            controller: _name,
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Enter a name';
              }
              if (text.length < 6) {
                return 'Too short';
              }
              return null;
            },
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _email,
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
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _password,
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
            onChanged: (value) => setState(() {}),
          ),
          const SizedBox(height: 30),
          _register(context),
          _login(context),
        ],
      ),
    );
  }

  Future addUser(String name, String email, String password) async {
    final user = User(name, email, password)
      ..name
      ..email
      ..password;
    final box = Boxes.getUsers();
    box.add(user);
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
      onPressed: () async {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          final name = _name.text;
          final email = _email.text;
          final password = _password.text;

          addUser(name, email, password);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil tambah data : $name $email $password"),
            ),
          );

          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => HomeScreen(),
          //   ),
          // );
        }
        setState(() {});
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
