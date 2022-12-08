import 'package:auth_bloc_hive/boxes/boxes.dart';
import 'package:auth_bloc_hive/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: _Home(),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final box = Boxes.getUsers();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = box.values
        .map((e) {
          final newUser = User(
            e.name,
            e.email,
            e.password,
          );
          return newUser;
        })
        .toList()
        .cast<User>();
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome ${data[0].name}!",
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  data[0].email,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.ibb.co/PGv8ZzG/me.jpg",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
