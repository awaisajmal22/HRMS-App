import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Model/jobSite_recruiter_model.dart';
import '../Services/add_weekly_hours_recruiter_services.dart';
import '../Services/jobsite_recruiter_services.dart';

class WeeklyTotalHoursRecruiterViewModel extends GetxController {
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

  Future<bool> submitWeeklyRecruiterHour(
      {required String startDate,
      required int workerId,
      required String endDate,
      required double totalHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await WeeklyRecruiterServices()
        .weeklySubmitHoursRecruiterServices(
            generalExpValue: generalExpValue,
            workerId: workerId,
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
