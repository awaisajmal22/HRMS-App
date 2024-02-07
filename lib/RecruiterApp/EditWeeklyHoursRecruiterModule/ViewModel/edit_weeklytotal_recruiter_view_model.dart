import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Services/edit_weekly_hours_recruiter_services.dart';

class EditWeeklyTotalHoursRecruiterViewModel extends GetxController {
  TextEditingController payPeriodController = TextEditingController();
  TextEditingController jobSiteController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController generalExpController = TextEditingController();
  TextEditingController parkingTravelController = TextEditingController();
  TextEditingController totalHoursController = TextEditingController();

  RxString selectedPayPeriod = 'Monday+Date to Sunday+Date'.obs;
  var payPeriodList = ['Monday+Date to Sunday+Date'];

  RxString startDate = 'Monday+Date'.obs;
  RxString endDate = 'Sunday+Date'.obs;
  // void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   startDate.value =
  //       DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
  //   endDate.value = DateFormat('dd, MMMM yyyy')
  //       .format(args.value.endDate ?? args.value.startDate)
  //       .toString();
  // }

  Future<bool> editRecruiterWeeklyHours(
      {required String startDate,
      required String endDate,
      required double totalHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required int id,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await EditWeeklyRecruiterServices()
        .editweeklyHoursRecruiterServices(
            generalExpValue: generalExpValue,
            id: id,
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
