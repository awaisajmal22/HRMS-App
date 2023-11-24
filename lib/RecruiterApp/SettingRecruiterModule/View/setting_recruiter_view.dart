import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';
import '../../BottomNavBarRecruiterModule/ViewModel/bottom_nav_bar_recruiter_view_model.dart';
import '../ViewModel/setting_recruiter_view_model.dart';

class SettingRecruiterView extends StatelessWidget {
  SettingRecruiterView({super.key});
  final navBarVM = Get.put(BottomNavBarRecruiterRecruiterViewModel());
  final settingVM = Get.put(SettingRecruiterViewModel());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customAppBar(
          isBackButton: true,
          title: 'Settings',
          onTap: () {
            navBarVM.tabIndex.value = 0;
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28.h,
              ),
              appText(
                title: 'Account Settings',
                fontSize: 18,
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.black.withOpacity(0.10)),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(title: 'John Doe', fontSize: 16),
                      appText(
                        title: 'johndoe@example.com',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.black.withOpacity(0.50),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                          title: 'Notification Settings',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      appText(
                        title: 'Manage your preferences',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        textColor: AppColor.black.withOpacity(0.50),
                      ),
                    ],
                  ),
                  Obx(
                    () => TextButton(
                      onPressed: () {
                        settingVM.isEnabledNotification.value =
                            !settingVM.isEnabledNotification.value;
                      },
                      child: appText(
                          title: settingVM.isEnabledNotification.value == true
                              ? 'Disabled'
                              : 'Enabled',
                          fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(color: AppColor.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: const Offset(0, 0),
                        color: AppColor.black.withOpacity(0.10))
                  ]),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: appText(
                    title: 'Change Password',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
