import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrmsapp/Constant/Model/response_model.dart';
import 'package:hrmsapp/AuthModule/OtpModule/ViewModel/otp_view_model.dart';
import 'package:hrmsapp/Constant/AppButton/text_button.dart';
import 'package:hrmsapp/Constant/AppColors/colors.dart';
import 'package:hrmsapp/Constant/AppText/app_text.dart';
import 'package:hrmsapp/Constant/Toast/fllutter_toast.dart';

import '../../../RoutesAndBindings/app_routes.dart';

class OtpView extends StatelessWidget {
  
   OtpView({super.key});
String email = Get.arguments;
final otpVM = Get.find<OtpViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding:  EdgeInsets.only(left: 20.w,right: 20.w, top: 100.h, bottom: 50.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText(title: 'Enter OTP',fontSize: 30, fontWeight: FontWeight.w600),
            
            appText(title: 'Please enter the verification code sent to:', fontSize: 14, fontWeight: FontWeight.w500),
            appText(title: email, fontSize: 12, fontWeight: FontWeight.w400, textColor: AppColor.black.withOpacity(0.5)),
            SizedBox(
              height: 16.h,
            ),
             SizedBox(
              height: 30.h,
               child: OtpTextField(
                fieldWidth: 36.w,
                textStyle: GoogleFonts.roboto(
                  height: 0.85,
                  fontSize: 16, fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
                
                cursorColor: AppColor.black.withOpacity(0.51),
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                focusedBorderColor: AppColor.black.withOpacity(0.51),
                enabledBorderColor: AppColor.black.withOpacity(0.51),
                       numberOfFields: 4,
                       
                       borderColor: AppColor.black.withOpacity(0.51),
                       
                       showFieldAsBox: true, 
                       //runs when a code is typed in
                       onCodeChanged: (String code) {
                           //handle validation or checks here           
                       },
                       //runs when every textfield is filled
                       onSubmit: (String verificationCode){
        otpVM.verificationCode.value = verificationCode.toString();
        print(otpVM.verificationCode.value);
                       }, // end onSubmit
                   ),
             ),
            const Spacer(),
             customTextButton(title: 'Continnue', onTap: () async{
             ResponseModel result = await otpVM.getOtpVerificationResponse(email: email, verificationCode: otpVM.verificationCode.value);
             print(otpVM.verificationCode.value);
             if(result.status == 'Error' || result.status == ''){
              Get.toNamed(AppRoutes.loginView);
             } else {
              Get.toNamed(AppRoutes.changePasswordView, arguments: [email, otpVM.verificationCode.value]);
             }
             
             }, buttonColor: AppColor.blue,)
          ],
        ),
      )),
    );
  }
}