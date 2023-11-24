import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/colors.dart';

Widget customTextField({
  required String hintText,
  required TextEditingController controller,
  TextInputType textInputType = TextInputType.text,
  TextInputAction textInputAction = TextInputAction.next,
  bool obsecureText = false,
  double height = 36,
  double fontSize = 14,
  double horizontalPadding = 12,
  double verticalPadding = 8,
  VoidCallback? onTap,
bool readOnly = false,
Color borderColor = AppColor.black,
double opacity = 0.10,
  int maxLines = 1,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: borderColor.withOpacity(opacity),
          // width: 1,
        )),
    height: height.h,
    child: TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      maxLines: maxLines,
      obscureText: obsecureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      style: GoogleFonts.roboto().copyWith(
        color: AppColor.black.withOpacity(0.50),
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.roboto().copyWith(
          color: AppColor.black.withOpacity(0.50),
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
        contentPadding: EdgeInsets.fromLTRB(horizontalPadding.w, verticalPadding.h, horizontalPadding.w, verticalPadding.h),
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
