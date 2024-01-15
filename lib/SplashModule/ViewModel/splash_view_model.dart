import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../RoutesAndBindings/app_routes.dart';
import '../../AuthModule/Login/Services/login_services.dart';

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Timer.periodic(
        const Duration(
          seconds: 2,
        ), (timer) {
      onLogin();
      timer.cancel();
    });
    super.onInit();
  }

  onLogin() async {
    final prefs = await SharedPreferences.getInstance();
    
    final email = prefs.getString('email');
    final password = prefs.getString('pass');
    final userRole = prefs.getString('userRole');
    print(email);
    if(prefs.containsKey('email') && prefs.containsKey('pass')){
    if (password == '' || password == null && email == '' || email == null) {
     Get.offAllNamed(AppRoutes.loginView);
    } else {
      
       final userModel = await LoginService().loginServices(
        username: email,
        password: password!, 
      );
      if (userModel.token == '' || userModel.token == null) {
        prefs.setString('token', userModel.token);
        prefs.setInt('check', userModel.timeSheettype);
      if(userModel.userRoles![0] == "RECRUITER"){
            Get.offAllNamed(AppRoutes.onBoardingRecruiterView, arguments: userModel.token);
          }
          else if(userModel.userRoles![0] == "WORKER"){
         Get.offAllNamed(
          AppRoutes.onBoardingView,
          arguments: userModel.token,
        );
          } else {
            Get.offAllNamed(AppRoutes.loginView);
          }
      } else {
          prefs.setString('token', userModel.token);
          prefs.setInt('check', userModel.timeSheettype);
          if(userModel.userRoles![0] == "RECRUITER"){
            Get.offAllNamed(AppRoutes.onBoardingRecruiterView, arguments: userModel.token);
          }
          else if(userModel.userRoles![0] == "WORKER"){
         Get.offAllNamed(
          AppRoutes.onBoardingView,
          arguments: userModel.token,
        );
          } else {
            Get.offAllNamed(AppRoutes.loginView);
          }
      }
    }}else{
       Get.offAllNamed(AppRoutes.loginView);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
