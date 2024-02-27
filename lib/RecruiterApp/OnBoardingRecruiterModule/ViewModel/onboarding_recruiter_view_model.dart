import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingRecruiterViewModel extends GetxController {
  RxString name = ''.obs;
  RxString lastname =''.obs;
  RxString token = ''.obs;
  getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name.value = pref.getString('name') ?? '';
    lastname.value = pref.getString('lastname')?? '';
    token.value = pref.getString('token') ?? '';
  }
  checkVersion(BuildContext context) async {
    //

    await Future.delayed(Duration(milliseconds: 300));

    await NewVersionPlus(
      iOSId: 'com.vconekt.hrmsapp',
      androidId: 'com.vconekt.hrmsapp',
    ).showAlertIfNecessary(
        context: context,
        launchModeVersion: Platform.isAndroid
            ? LaunchModeVersion.external
            : LaunchModeVersion.normal);

    
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getName();
    super.onInit();
  }
}
