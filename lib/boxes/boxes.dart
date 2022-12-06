import 'package:auth_bloc_hive/models/user_model.dart';
import 'package:auth_bloc_hive/models/constant.dart' as constant;
import 'package:hive/hive.dart';

class Boxes {
  static Box<User> getUsers() => Hive.box<User>(constant.userBox);
}
