import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmsapp/AuthModule/Forgetpassword/View/forget_password_view.dart';

import '../../../../Constant/AppBar/custom_app_bar.dart';
import '../../../../Constant/AppButton/text_button.dart';
import '../../../../Constant/AppColors/colors.dart';
import '../../../../Constant/AppText/app_text.dart';
import '../../../../Constant/AppTextField/app_textfield.dart';
import '../../../../Constant/Toast/fllutter_toast.dart';
import '../../../../RoutesAndBindings/app_routes.dart';
import '../../../../Utils/spint_kit_view_spinner.dart';
import '../Model/login_model.dart';
import '../ViewModel/login_view_model.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final loginVM = Get.find<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginVM.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          children: [
            SizedBox(
              height: 90.h,
            ),
            // customAppBar(title: 'Login'),
            SvgPicture.asset(
              'assets/icons/logo.svg',
              color: AppColor.blue,
            ),
            SizedBox(
              height: 34.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                  title: 'Login', fontSize: 32, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(
                title: 'Please login to continue',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textColor: AppColor.black.withOpacity(0.60),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(title: 'Username', fontSize: 14),
            ),
            SizedBox(
              height: 4.h,
            ),
            customTextField(
              controller: loginVM.usernameController,
              hintText: 'Enter your username',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 12.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: appText(title: 'Password', fontSize: 14),
            ),
            SizedBox(
              height: 4.h,
            ),
            customTextField(
              obsecureText: true,
              controller: loginVM.passwordController,
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Expanded(
                  child: customTextButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.forgetPasswordView);
                    },
                    title: 'Forgot Password',
                    borderColor: AppColor.black,
                    buttonColor: AppColor.white,
                    textColor: AppColor.black,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: customTextButton(
                    onTap: () async {
                      if (loginVM.formKey.currentState!.validate() &&
                          loginVM.usernameController.text.isNotEmpty == true &&
                          loginVM.passwordController.text.isNotEmpty == true) {
                        loginVM.formKey.currentState?.save();

                        showLoadingIndicator(context: context);
                        UserModel result = await loginVM.onLogin(
                          context: context,
                          password: loginVM.passwordController.text,
                          username: loginVM.usernameController.text,
                        );
                        print(result.id);
                        hideOpenDialog(context: context);
                        if (result!= null) {
                            loginVM.setUser(
                              userRole: result.userRoles![0],
                              password: loginVM.passwordController.text,
                                email: result.email,
                                check: result.timeSheettype,
                                token: result.token ?? "",
                                name: result.fname,
                                id: result.id);
                                if(result.userRoles![0] == "RECRUITER"){
                                  print('recruiter is here');
                                  Get.offAllNamed(AppRoutes.onBoardingRecruiterView, arguments: result.token);
                                } else if(result.userRoles![0]== "WORKER"){
                            Get.offAllNamed(
                              AppRoutes.onBoardingView,
                              arguments: result.token,
                            );
                                }
                          } else{
                            hideOpenDialog(context: context);
                          }
                        
                      } else if(loginVM.passwordController.text.isEmpty) {
                        toast(
                            msg: "Please enter a valid password");
                      }else{
                        toast(
                            msg: "Please enter a valid user");
                      }
                    },
                    title: 'Login',
                    borderColor: AppColor.blue,
                    buttonColor: AppColor.blue,
                    textColor: AppColor.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
