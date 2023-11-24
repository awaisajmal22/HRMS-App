import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/login_model.dart';
import '../Services/login_services.dart';

class LoginViewModel extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<UserModel> onLogin({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    UserModel userModel = await loginServices(
        username: username, password: password, );
    return userModel;
  }

  setUser(
      {required String name,
      required String email,
      required String id,
      required String token,
      required String password,
      required int check}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id', id);
    pref.setString('name', name);
    pref.setString('token', token);
    pref.setString('pass', password);
    pref.setInt('check', check);
    pref.setString('email', email);
  }
}
