import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/AuthModule/Forgetpassword/ViewModel/forget_password_view_model.dart';
import 'package:hrmsapp/Constant/AppButton/text_button.dart';
import 'package:hrmsapp/Constant/AppColors/colors.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:hrmsapp/Constant/AppTextField/app_textfield.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
final forgetPassVM = Get.find<ForgetPasswordViewModel>();
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
                appText(title: 'Forgot Your Password', fontSize: 30, fontWeight: FontWeight.w600,),
                SizedBox(
                  height: 10.h,
                ),
                 appText(title: 'Enter new password to rest the password', fontSize: 15.8, fontWeight: FontWeight.w400,textColor: Colors.black.withOpacity(0.6)),
                 SizedBox(
                  height: 28.h,
                 ),
                    appText(title: 'Enter your Authorized email:', fontSize: 15.8, fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 10.h,
                  ),
            customTextField(hintText: 'Enter your email', controller: forgetPassVM.emailController,height: 56, fontSize: 15.8, verticalPadding: 18, horizontalPadding: 20),
            SizedBox(
            height: 20.h,
            ),
                  appText(title: 'New Password*', fontSize: 15.8, fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 10.h,
                  ),
            customTextField(hintText: 'Enter your new password', controller: forgetPassVM.emailController,height: 56, fontSize: 15.8, verticalPadding: 18, horizontalPadding: 20),
            SizedBox(
            height: 20.h,
            ),
             appText(title: 'Confirm Password*', fontSize: 15.8, fontWeight: FontWeight.w500,),
                  SizedBox(
                    height: 10.h,
                  ),
            customTextField(hintText: 'Confirm new password', controller: forgetPassVM.emailController,height: 56, fontSize: 15.8, verticalPadding: 18, horizontalPadding: 20),
            SizedBox(
              height: 48.h,
            ),
            customTextButton(title: 'Continue', onTap: (){}, buttonColor: AppColor.blue)
              ],
            ),
          ],
        ),
      ),
    );
  }
}