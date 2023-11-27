import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppButton/text_button.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppDialogs/sucessfully_hours_submit_dialog.dart';
import '../../../Constant/AppText/app_text.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            onTap: (){
              Get.back();
            },
              title: 'Weekly summary',
              opacity: 0.10,
              isBackButton: true,
             ),
          Padding(
            padding: EdgeInsets.only(left: 19.w, top: 26.h, right: 26.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText(title: 'Weekly Summary', fontSize: 14),
                    Image.asset(
                      'assets/icons/create.png',
                      height: 22.h,
                      width: 22.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              padding: EdgeInsets.only(
                  left: 17.w, right: 21.w, top: 38.h, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.blue.withOpacity(0.06),
              ),
              child: Column(
                children: List.generate(6, (index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            appText(
                              title: 'Week',
                              fontSize: index == 0 ? 14 : 12,
                              fontWeight: index == 0
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                            appText(
                              title: 'Week',
                              fontSize: index == 0 ? 14 : 12,
                              fontWeight: index == 0
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      index == 5
                          ? const SizedBox.shrink()
                          : Container(
                              height: 0.5.h,
                              color: AppColor.black,
                            )
                    ],
                  );
                }),
              )),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                customTextButton(
                  buttonColor: AppColor.blue,
                  onTap: () {
                    sucessfullyHoursAddedDialog(
                        isCheckButton: false,
                        context: context,
                        title:
                            'Your Summary Successfully submitted  to Admin Panel',
                        checkTitle: '',
                        onTap: () {});
                  },
                  title: 'Submit',
                ),
                SizedBox(
                  height: 10.h,
                ),
                customTextButton(
                  buttonColor: AppColor.blue.withOpacity(0.37),
                  onTap: () {
                    Get.back();
                  },
                  title: 'Close',
                ),
                SizedBox(
                  height: 72.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
