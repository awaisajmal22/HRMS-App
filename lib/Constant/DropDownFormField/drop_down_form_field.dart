import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../AppColors/colors.dart';

class AppDropdownInput<T> extends StatelessWidget {
  final List<T> options;
  final T value;
  final void Function(T) onChanged;
  AppDropdownInput({
    this.options = const [],
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: FormField<T>(
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
              hintText: 'Select job site',
              hintStyle: GoogleFonts.roboto().copyWith(
                  color: AppColor.black.withOpacity(0.50), fontSize: 14.sp),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: AppColor.black.withOpacity(0.2),
                    width: 1,
                  )),
            ),
            isEmpty: value == null || value == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColor.black.withOpacity(0.20),
                ),
                value: value,
                isDense: true,
                onChanged: (value) {
                  onChanged(value!);
                },
                items: options.map((T value) {
                  return DropdownMenuItem<T>(
                      value: value,
                      child: Text(value.toString(),
                          style: GoogleFonts.roboto().copyWith(
                            color: AppColor.black.withOpacity(0.50),
                            fontSize: 14.sp,
                          )));
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
