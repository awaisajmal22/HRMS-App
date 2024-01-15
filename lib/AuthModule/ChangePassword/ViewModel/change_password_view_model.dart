import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/Constant/Model/response_model.dart';

import '../services/change_password_services.dart';

class ChangePasswordViewModel extends GetxController{
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Future<ResponseModel> changePassword({required String email, required String verificationCode, required String password}) async {
    ResponseModel response = await changePasswordServices(email: email, verificationCode: verificationCode, password: password);
    return response;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  
}