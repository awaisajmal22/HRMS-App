import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../Constant/AppColors/colors.dart';
import '../Constant/AppText/app_text.dart';

class ShowMessage {
  showMessage(
    String message,
  ) {
    return Get.snackbar(
      "Success", message,
      titleText: appText(
       title: 'Success',
        
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        ),
    
      messageText: appText(
       title: message,
       
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        
      ),
      snackPosition: SnackPosition.TOP,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      borderRadius: 30,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      //maxWidth: 100,
      animationDuration: const Duration(milliseconds: 200),
      backgroundGradient: const LinearGradient(
        colors: [Colors.transparent, Colors.transparent],
      ),
      // While using borderColor ensure you are using borderWidth otherwise error will be generated
      borderColor: AppColor.blue.withOpacity(0.5),
      borderWidth: 2,

      // forwardAnimationCurve: Curves.bounceInOut,

      isDismissible: true,

      padding: const EdgeInsets.only(left: 70, top: 20, bottom: 20),

      snackStyle: SnackStyle.FLOATING,
    );
  }

  // showErrorMessage(String message) {
  //   if (Get.isSnackbarOpen == false) {
  //     return Get.snackbar(
  //       "Error", message,
  //       titleText: appText(
  //         title:'Error',
          
  //           fontWeight: FontWeight.w700,
  //           fontSize: 14.0,
          
  //       ),
  //       icon: Icon(
  //         Icons.error,
  //         color: Colors.red,
  //       ),
  //       messageText: appText(
  //        title: message,
          
  //           fontWeight: FontWeight.w700,
  //           fontSize: 14.0,
  //         ),
          
  //       snackPosition: SnackPosition.TOP,
  //       colorText: Colors.white,
  //       backgroundColor: Colors.black,
  //       borderRadius: 30,
  //       margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
  //       //maxWidth: 100,
  //       animationDuration: const Duration(milliseconds: 200),
  //       backgroundGradient: const LinearGradient(
  //         colors: [Colors.transparent, Colors.transparent],
  //       ),
  //       // While using borderColor ensure you are using borderWidth otherwise error will be generated
  //       borderColor: AppColor.blue.withOpacity(0.5),
  //       borderWidth: 2,

  //       forwardAnimationCurve: Curves.bounceInOut,

  //       isDismissible: true,

  //       padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),

  //       snackStyle: SnackStyle.FLOATING,
  //     );
  //   }
  // }
}

SnackbarController SnackbarTransactionConfirm() {
  return Get.snackbar(
    "Transaction Submitted", "Waiting for confirmation",
    titleText:
    appText(
      title:   'Transaction Submitted',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      textColor: AppColor.white,
    ),

    icon:  const SpinKitSpinningLines(
      size: 50,

      color: AppColor.blue,
    ),
    messageText:  appText(
      title:   'Waiting for confirmation',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      textColor: AppColor.black,
    ),
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    backgroundColor: Colors.black,
    borderRadius: 8,
    margin: const EdgeInsets.only(top: 100, left: 25, right: 25, bottom: 30),
    //maxWidth: 100,
    animationDuration: const Duration(milliseconds: 300),
    backgroundGradient:  LinearGradient(
      colors: [const Color(0xffCCF869).withOpacity(0.3), const Color(0xffCCF869).withOpacity(0.3),],
    ),
    // While using borderColor ensure you are using borderWidth otherwise error will be generated
    borderWidth: 2,

    forwardAnimationCurve: Curves.bounceInOut,

    isDismissible: true,

    padding: const EdgeInsets.only(left: 70, top: 20, bottom: 20),

    snackStyle: SnackStyle.FLOATING,
  );
}

