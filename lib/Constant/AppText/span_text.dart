
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/colors.dart';

Widget spanText({required String title}) {
    return RichText(
      text: TextSpan(
          text: title,
          style: GoogleFonts.roboto().copyWith(
            color: AppColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
                text: '(Optional)',
                style: GoogleFonts.roboto().copyWith(
                  color: AppColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ))
          ]),
    );
  }