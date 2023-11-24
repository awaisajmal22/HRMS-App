
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../AppColors/colors.dart';
import '../AppText/app_text.dart';

Widget customTextButton(
      {required String title,
      required Function onTap,
      Color borderColor = Colors.transparent,
      Color buttonColor = AppColor.black,
      Color textColor = AppColor.white,
      double fontSize = 16,
      double radius = 8,
      double height = 42,
      FontWeight fontWeight = FontWeight.w500}) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          // padding: EdgeInsets.fromLTRB(10.w, 12.h, 10.w, 12.h),
          height: height.h,
          // width: double.infinity,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: borderColor,
                width: 1,
              )),
          child: Center(
            child: appText(
                title: title,
                fontSize: fontSize,
                fontWeight: fontWeight,
                textColor: textColor),
          ),
        ),
      ),
    );
  }