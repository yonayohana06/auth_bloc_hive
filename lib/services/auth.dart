import 'package:auth_bloc_hive/boxes/boxes.dart';
import 'package:auth_bloc_hive/models/user_model.dart';
import 'package:hive/hive.dart';

class AuthService {
  late Box<User> _users;

  Future<void> init() async {
    _users = Boxes.getUsers();
  }

  Future<String?> authenticateUser(
    final String email,
    final String pass,
  ) async {
    final success = _users.values
        .any((element) => element.email == email && element.password == pass);
    if (success) {
      return email;
    } else {
      return null;
    }
  }
}
