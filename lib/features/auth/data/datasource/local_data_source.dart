import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthLocalDataSource {
  static const String usersKey = "users";
  static const String currentUserKey = "current_user";

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> users = prefs.getStringList(usersKey) ?? [];

    users.add(jsonEncode(user.toJson()));

    await prefs.setStringList(usersKey, users);
  }

  Future<List<UserModel>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();

    final users = prefs.getStringList(usersKey) ?? [];

    return users
        .map(
          (e) => UserModel.fromJson(
            jsonDecode(e),
          ),
        )
        .toList();
  }

  Future<void> saveCurrentUser(String employeeId) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      currentUserKey,
      employeeId,
    );
  }

  Future<String?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(currentUserKey);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(currentUserKey);
  }

  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
  }
}
