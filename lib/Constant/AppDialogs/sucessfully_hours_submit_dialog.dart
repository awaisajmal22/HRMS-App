import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../RoutesAndBindings/app_routes.dart';
import '../AppButton/text_button.dart';
import '../AppColors/colors.dart';
import '../AppText/app_text.dart';

sucessfullyHoursAddedDialog(
    {required BuildContext context,
    required String title,
    required String checkTitle,
    bool isCheckButton = true,
    required VoidCallback backButtonCallback,
    required VoidCallback onTap}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          height: 334.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColor.white),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/flash.svg',
                        height: 83.h,
                        width: 83.w,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      dialogText(
                        title: title,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      isCheckButton == true
                          ? customTextButton(
                              buttonColor: AppColor.blue,
                              onTap: () {
                                onTap();
                              },
                              title: checkTitle)
                          : const SizedBox.shrink(),
                      isCheckButton == true
                          ? SizedBox(
                              height: 10.h,
                            )
                          : const SizedBox.shrink(),
                      customTextButton(
                        buttonColor: isCheckButton == true
                            ? AppColor.blue.withOpacity(0.37)
                            : AppColor.blue,
                        onTap: backButtonCallback,
                        title: 'Close',
                      ),
                      isCheckButton == true
                          ? const SizedBox.shrink()
                          : SizedBox(
                              height: 52.h,
                            )
                    ],
                  ),
                ),
                Positioned(
                    top: 19.h,
                    right: 22.w,
                    child: GestureDetector(
                      onTap: backButtonCallback,
                      child: SvgPicture.asset('assets/icons/close.svg'),
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
}

sucessfullyHoursAddedRecruiterDialog(
    {required BuildContext context,
    required String title,
    required String checkTitle,
    required VoidCallback backButtonCallback,
    bool isCheckButton = true,
    required VoidCallback onTap}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          height: 334.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColor.white),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/flash.svg',
                        height: 83.h,
                        width: 83.w,
                      ),
                      SizedBox(
                        height: 13.h,
                      ),
                      dialogText(
                        title: title,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      isCheckButton == true
                          ? customTextButton(
                              buttonColor: AppColor.blue,
                              onTap: () {
                                onTap();
                              },
                              title: checkTitle)
                          : const SizedBox.shrink(),
                      isCheckButton == true
                          ? SizedBox(
                              height: 10.h,
                            )
                          : const SizedBox.shrink(),
                      customTextButton(
                        buttonColor: isCheckButton == true
                            ? AppColor.blue.withOpacity(0.37)
                            : AppColor.blue,
                        onTap: backButtonCallback,
                        title: 'Close',
                      ),
                      isCheckButton == true
                          ? const SizedBox.shrink()
                          : SizedBox(
                              height: 52.h,
                            )
                    ],
                  ),
                ),
                Positioned(
                    top: 19.h,
                    right: 22.w,
                    child: GestureDetector(
                      onTap: backButtonCallback,
                      child: SvgPicture.asset('assets/icons/close.svg'),
                    ))
              ],
            ),
          ),
        ),
      );
    },
  );
}
