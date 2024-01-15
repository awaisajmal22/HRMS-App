
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/AuthModule/ChangePassword/ViewModel/change_password_view_model.dart';
import 'package:hrmsapp/Constant/AppButton/text_button.dart';
import 'package:hrmsapp/Constant/AppColors/colors.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:hrmsapp/Constant/AppTextField/app_textfield.dart';
import 'package:hrmsapp/Constant/Model/response_model.dart';
import 'package:hrmsapp/Constant/Toast/fllutter_toast.dart';

import '../../../RoutesAndBindings/app_routes.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});
final changePassVM = Get.find<ChangePasswordViewModel>();
String email = Get.arguments[0];
String verificationCode = Get.arguments[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
           Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                SizedBox(
                  height: 100.h,
                ),
                appText(title: 'Change Your Password', fontSize: 30, fontWeight: FontWeight.w600,),
                SizedBox(
                  height: 10.h,
                ),
                 appText(title: 'Enter new password to rest the password', fontSize: 15.8, fontWeight: FontWeight.w400,textColor: Colors.black.withOpacity(0.6)),
                 SizedBox(
                  height: 28.h,
                 ),
                    appText(title: 'New Password*', fontSize: 15.8, fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 10.h,
                  ),
            customTextField(hintText: 'Enter your new password', controller: changePassVM.newPasswordController, obsecureText: true),
            SizedBox(
              height: 18.h,
            ),
            appText(title: 'Confirm Password*', fontSize: 15.8, fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 10.h,
                  ),
            customTextField(obsecureText:true, hintText: 'Confirm new password', controller: changePassVM.confirmPasswordController, textInputAction: TextInputAction.done),
          
            SizedBox(
              height: 48.h,
            ),
            customTextButton(title: 'Continue', onTap: ()async {
             
            if(changePassVM.newPasswordController.text == changePassVM.confirmPasswordController.text && changePassVM.newPasswordController.text.length >= 6 && changePassVM.confirmPasswordController.text.length >= 6){
           print(email);
              print(changePassVM.confirmPasswordController.text);  
                ResponseModel response = await changePassVM.changePassword(email: email, verificationCode: verificationCode, password: changePassVM.confirmPasswordController.text);
              if(response.status == "Success "){
              toast(msg: "Password Change Successfully.");
              Get.offAllNamed(AppRoutes.loginView);
              }else{
                toast(msg: "Something went wrong please try again.");
              }
            }else if(changePassVM.newPasswordController.text.length < 6){
              toast(msg: 'Please Enter Correct Password.,');
            } else if(changePassVM.newPasswordController.text != changePassVM.confirmPasswordController.text){
              toast(msg: 'Confirm Password do not Match.');
            }

            }, buttonColor: AppColor.blue)
              ],
            ),
          ],
        ),
      ),
    );
  }
}