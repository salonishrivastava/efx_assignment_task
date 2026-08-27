import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserRepository {
  static const String _usersKey = "users";
  static const String _currentUserKey = "currentUser";
}
