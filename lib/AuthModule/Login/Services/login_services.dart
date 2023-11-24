import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../Constant/Toast/fllutter_toast.dart';
import '../../../../Network/api_service.dart';
import '../../../../Network/api_url.dart';
import '../../../../RoutesAndBindings/app_routes.dart';
import '../../../../Utils/HiveHelper/hive_helper_sevices.dart';
import '../../../../Utils/Storage/get_storage_handler.dart';
import '../../../../Utils/spint_kit_view_spinner.dart';
import '../../../../Utils/toast_message.dart';
import '../Model/login_model.dart';

Future<UserModel> loginServices({
  required String username,
  required String password,
}) async {
  bool? isSuccess = false;
  UserModel userModel = UserModel.fromJson({});
  try {
    var data = {
      "username": username,
      "password": password,
    };
    var response = await API().postRequest(ApiUrl.loginURL, data);
    // print(response.data);
    if (response == null ||
        response.statusCode == 500 ||
        response.statusCode == 401 ||
        response.statusCode == 400) {
      // hideOpenDialog(context: context);
      toast(
        msg: 'Something went wrong...'.toString(),
      );
    } else if (response.statusCode == 200) {
      isSuccess = true;
      print(response);
      GetStorageHandler handler = GetStorageHandler();
      await handler.setToken(response.data["token"]);
      // final Map<String, dynamic> jsonDataMap = json.decode(response);
      // print(jsonDataMap);
      userModel = UserModel.fromJson(response.data);
      print(userModel);

      // ShowMessage().showMessage("Login Successfully!");
    } else {
      toast(
        msg: response.data["message"].toString(),
      );
    }
  } catch (e) {
    toast(msg: e.toString());
  }
  return userModel;
}
