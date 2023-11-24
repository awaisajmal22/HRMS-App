import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constant/AppColors/colors.dart';
import '../Constant/AppText/app_text.dart';
import '../Constant/Toast/fllutter_toast.dart';
import '../RoutesAndBindings/app_routes.dart';
import 'Storage/get_storage_handler.dart';
import 'spint_kit_view_spinner.dart';

onLogoutPop(BuildContext context) {
  final fontSize = MediaQuery.of(context).size;
  return showGeneralDialog(
      barrierColor: Colors.white.withOpacity(0.05),
      barrierDismissible: false,
      context: context,
      pageBuilder: (BuildContext context, _, __) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: AppColor.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    appText(
                        title: "Are you sure?".tr,
                        textColor: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                    const SizedBox(
                      height: 15,
                    ),
                    appText(
                        title: "Do you want to Logout !".tr,
                        textColor: AppColor.black.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 45,
                            width: fontSize.height / 6.76,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColor.blue, width: 1.5),
                            ),
                            child: Center(
                              child: appText(
                                  title: "No".tr,
                                  textColor: AppColor.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            GetStorageHandler().removeCache();
                            Get.offAllNamed(AppRoutes.loginView);
                          },
                          child: Container(
                            height: 45,
                            width: fontSize.height / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.blue,
                              border:
                                  Border.all(color: AppColor.blue, width: 1.5),
                            ),
                            child: Center(
                              child: appText(
                                  title: "Yes".tr,
                                  textColor: AppColor.black.withOpacity(0.33),
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

onDeleteAccountPop(BuildContext context, dynamic settingsViewModel, id) {
  final fontSize = MediaQuery.of(context).size;
  return showGeneralDialog(
      barrierColor: Colors.white.withOpacity(0.05),
      barrierDismissible: false,
      context: context,
      pageBuilder: (BuildContext context, _, __) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.8, sigmaY: 1.8),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    appText(
                        title: "Are you sure?".tr,
                        textColor: AppColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    const SizedBox(
                      height: 15,
                    ),
                    appText(
                        title:
                            "Do you want to Delete your account , You can't use this account anymore!"
                                .tr,
                        textColor: AppColor.black.withOpacity(0.5),
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w300),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 45,
                            width: fontSize.height / 6.76,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColor.blue, width: 1.5),
                            ),
                            child: Center(
                              child: appText(
                                  title: "No".tr,
                                  textColor: AppColor.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showLoadingIndicator(context: context);
                            settingsViewModel.onDeleteAccount().then((value) {
                              if (value == true) {
                                GetStorageHandler().removeCache();
                                Get.offAllNamed(AppRoutes.loginView);
                              } else {
                                toast(msg:"Something went wrong!");
                              }
                            });
                          },
                          child: Container(
                            height: 45,
                            width: fontSize.height / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.white,
                              border:
                                  Border.all(color: AppColor.white, width: 1.5),
                            ),
                            child: Center(
                              child: appText(
                                  title: "Yes".tr,
                                  textColor: AppColor.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

onIncompleteProfilePop(BuildContext context) {
  final fontSize = MediaQuery.of(context).size;
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  appText(
                      title: "Complete Your Profile!".tr,
                      textColor: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  const SizedBox(
                    height: 5,
                  ),
                  appText(
                      title:
                          "Your Profile Info is Incomplete , Please update your profile before Booking."
                              .tr,
                      textColor: AppColor.black.withOpacity(0.5),
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: fontSize.height / 9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.blue,
                            border:
                                Border.all(color: AppColor.blue, width: 1.5),
                          ),
                          child: Center(
                            child: appText(
                                title: "OK".tr,
                                textColor: AppColor.white,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

onExitPop(BuildContext context) async {
  final fontSize = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: fontSize.height / 5.07,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  appText(
                    title: "Are you sure?".tr,
                    textColor: AppColor.blue,
                    fontSize: 20,
                    // fontWeight: FontWeights.bold
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  appText(
                    title: "Do you want to Exit!".tr,
                    textColor: AppColor.blue,
                    fontSize: 14,
                    // fontWeight: FontWeights.bold
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 45,
                          width: fontSize.height / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(color: AppColor.blue, width: 1.5),
                          ),
                          child: Center(
                            child: appText(
                              title: "No".tr,
                              textColor: AppColor.blue,
                              fontSize: 17,
                              // fontWeight: FontWeights.bold
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          exit(0);
                        },
                        child: Container(
                          height: 45,
                          width: fontSize.height / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.blue,
                            border:
                                Border.all(color: AppColor.blue, width: 1.5),
                          ),
                          child: Center(
                            child: appText(
                              title: "Yes".tr,
                              textColor: AppColor.blue,
                              fontSize: 14,
                              // fontWeight: FontWeights.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

onSessionExpirePopUp() {
  return Get.defaultDialog(
      barrierDismissible: false,
      title: "Session Expire!",
      backgroundColor: AppColor.black,
      titlePadding: const EdgeInsets.only(top: 20),
      onConfirm: () {
        GetStorageHandler().removeCache();
        Get.offAllNamed(AppRoutes.loginView);
      },
      confirm: GestureDetector(
        onTap: () {
          GetStorageHandler().removeCache();
          Get.offAllNamed(AppRoutes.loginView);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 40,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.blue,
              border: Border.all(color: AppColor.blue, width: 1.5),
            ),
            child: Center(
              child: appText(
                  title: "OK".tr,
                  textColor: AppColor.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appText(
                  title:
                      "Please click on OK sign in again to refresh session.".tr,
                  textColor: AppColor.white,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ],
          ),
        ),
      ),
      radius: 10.0);
}
