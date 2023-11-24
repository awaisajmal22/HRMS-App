import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/colors.dart';

Text appText(
        {required String title,
        Color textColor = AppColor.black,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.w500,
        FontStyle fontStyle = FontStyle.normal,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.roboto().copyWith(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
    );

Text dialogText(
        {required String title,
        Color textColor = AppColor.black,
        double fontSize = 20,
        FontWeight fontWeight = FontWeight.w500,
        FontStyle fontStyle = FontStyle.normal,
        TextAlign textAlign = TextAlign.center}) =>
    Text(
      title,
      textAlign: textAlign,
      style: GoogleFonts.roboto().copyWith(
          color: textColor,
          height: 2.07,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          fontStyle: fontStyle),
    );
