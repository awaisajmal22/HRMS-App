import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/colors.dart';

Widget customCommentTextField({
  required String hintText,
  required TextEditingController controller,
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  bool obsecureText = false,
  double opacity = 0.65,
  double height = 106,
  double fontSize = 14,
  int maxLines = 5,
  FontWeight fontWeight = FontWeight.w400,
  double borderOpacity = 0.33,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: AppColor.black.withOpacity(borderOpacity),
          // width: 1,
        )),
    height: height.h,
    child: TextFormField(
      maxLines: maxLines,
      obscureText: obsecureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: GoogleFonts.roboto().copyWith(
        color: AppColor.black.withOpacity(opacity),
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.roboto().copyWith(
          color: AppColor.black.withOpacity(opacity),
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
        contentPadding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.transparent,
            // width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.transparent,
            // width: 1,
          ),
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          borderSide: BorderSide(
            color: Colors.transparent,
            // width: 1,
          ),
        ),
      ),
    ),
  );
}
