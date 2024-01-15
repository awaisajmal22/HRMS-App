import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/AuthModule/Forgetpassword/services/forget_password_services.dart';

class ForgetPasswordViewModel extends GetxController{
  TextEditingController emailController = TextEditingController();
 Future<bool> forgetPassword({required String email}) async{
final check = await ForgetPassServices().forgetPassword(email: email);
return check;
 }
 @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    super.dispose();
  }
}