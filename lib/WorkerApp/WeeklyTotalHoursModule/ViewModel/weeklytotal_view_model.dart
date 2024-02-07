import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Model/jobSite_model.dart';
import '../Services/add_weekly_hours_services.dart';
import '../Services/jobsite_services.dart';

class WeeklyTotalHoursViewModel extends GetxController {
  // final DateRangePickerController dateController = DateRangePickerController();
  TextEditingController payPeriodController = TextEditingController();
  TextEditingController jobSiteController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController generalExpController = TextEditingController();
  TextEditingController parkingTravelController = TextEditingController();
  TextEditingController totalHoursController = TextEditingController();
  

 
 

  RxString startDate = 'Monday+Date'.obs;
  RxString endDate = 'Sunday+Date'.obs;
  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   startDate.value =
  //       DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
  //   endDate.value = DateFormat('dd, MMMM yyyy')
  //       .format(args.value.endDate ?? args.value.startDate)
  //       .toString();
  // }
  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   int firstDayOfWeek = DateTime.monday % 7;
  //   int endDayOfWeek = (firstDayOfWeek - 1) % 7;
  //   endDayOfWeek = endDayOfWeek <= 0 ? 7 + endDayOfWeek : endDayOfWeek;

  //   PickerDateRange ranges = args.value;
  //   DateTime date1 = ranges.startDate!;
  //   DateTime date2 = ranges.endDate ?? ranges.startDate!;

  //   if (date1.isAfter(date2)) {
  //     var date = date1;
  //     date1 = date2;
  //     date2 = date;
  //   }

  //   int day1 = date1.weekday % 7;
  //   int day2 = date2.weekday % 7;
  //   if (day2 == 0) {
  //     day2 = 7;
  //   }

  //   if (date1.weekday % 7 == 0 && date2.weekday % 7 == 0) {
  //     day1 = 7;
  //   }

  //   DateTime dat1 = date1.add(Duration(days: firstDayOfWeek - day1));
  //   DateTime dat2 = date2.add(Duration(days: endDayOfWeek - day2));

  //   if (!isSameDate(dat1, ranges.startDate) ||
  //       !isSameDate(dat2, ranges.endDate)) {
  //     dateController.selectedRange = PickerDateRange(dat1, dat2);
  //     startDate.value = DateFormat('dd, MMMM yyyy').format(dat1).toString();
  //     endDate.value =
  //         DateFormat('dd, MMMM yyyy').format(dat2 ?? dat1).toString();
  //     Duration numberOfHours = dat2.difference(dat1);
  //     // totalHoursController.text = "${numberOfHours.inHours} hrs";
  //   }
  // }

  bool isSameDate(DateTime? date1, DateTime? date2) {
    if (date2 == date1) {
      return true;
    }
    if (date1 == null || date2 == null) {
      return false;
    }
    return date1.month == date2.month &&
        date1.year == date2.year &&
        date1.day == date2.day;
  }

  Future<bool> submitWeeklyHour(
      {required String startDate,
      required String endDate,
      required double totalHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await WeeklyServices().weeklySubmitHoursServices(
        generalExpValue: generalExpValue,
       
        jobSiteID: jobSiteID,
        parkingTravelValue: parkingTravelValue,
        startDate: startDate,
        endDate: endDate,
        totalHours: totalHours,
        jobSite: jobSite,
        feedBack: feedBack,
        generalExpImage: generalExpImage,
        parkingTravelImage: parkingTravelImage);
    return isSuccess;
  }
  RxBool isKeyboard =false.obs;
  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((event) { 
      isKeyboard.value = event;
    });
    // TODO: implement onInit
    super.onInit();
  }
}
