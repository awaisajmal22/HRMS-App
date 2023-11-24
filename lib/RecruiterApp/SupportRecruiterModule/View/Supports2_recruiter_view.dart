import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constant/AppBar/custom_app_bar.dart';
import '../../../Constant/AppColors/colors.dart';
import '../../../Constant/AppText/app_text.dart';

class SupportsRecruiterView2 extends StatelessWidget {
  SupportsRecruiterView2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            title: 'Contact Support',
            onTap: () {},
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 27.w, top: 12.h, bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/email.png',
                    height: 32.h,
                    width: 32.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText(
                        title: 'Email Support',
                        textColor: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      appText(
                          title: 'Typically responds within 24\nhours',
                          textColor: AppColor.black.withOpacity(0.50),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.left),
                    ],
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: appText(
                      title: 'support@example.com',
                      textColor: AppColor.black,
                      fontSize: 14,
                      textAlign: TextAlign.right,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
