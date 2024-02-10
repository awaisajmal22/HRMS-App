import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
    UserModel userModel = await LoginService().loginServices(
      context: context,
        username: username, password: password, );
    return userModel;
  }

  setUser(
      {required String name,
      required String email,
      required String id,
      required String token,
      required String password,
      required String userRole,
      required String lastName,
      required int check}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('id', id);
    pref.setString('name', name);
    pref.setString('token', token);
    pref.setString('userRole', userRole);
    pref.setString('pass', password);
    pref.setInt('check', check);
    pref.setString('email', email);
    pref.setString('lastname', lastName);
  }
  RxBool isKeyboard =false.obs;
  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((event) { 
      isKeyboard.value = event;
    });
    // TODO: implement onInit
    super.onInit();
  }
}
