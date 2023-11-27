import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../AppColors/colors.dart';
import '../AppText/app_text.dart';

Widget customAppBar(
    {String title = '',
    bool isBackButton = false,
    
    double height = 72,
    required VoidCallback onTap,
    double opacity = 0.12}) {
  return Container(
    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 36.h, bottom: 12.h),
    height: height.h,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(20)),
        color: AppColor.blue,
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              spreadRadius: 0,
              offset: const Offset(0, 0),
              color: AppColor.black.withOpacity(opacity))
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isBackButton == true
            ? GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  'assets/icons/back.svg',
                  height: 24.h,
                  width: 24.w,
                  color: AppColor.white,
                ))
            : const SizedBox.shrink(),
        isBackButton == true
            ? SizedBox(
                width: 8.w,
              )
            : const SizedBox.shrink(),
        appText(title: title, textColor: AppColor.white),
      ],
    ),
  );
}
