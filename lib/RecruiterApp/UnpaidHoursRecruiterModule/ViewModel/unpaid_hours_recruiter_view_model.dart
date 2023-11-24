import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../WeeklyTotalHoursRecruiterModule/Model/jobSite_recruiter_model.dart';
import '../../WeeklyTotalHoursRecruiterModule/Services/jobsite_recruiter_services.dart';
import '../Services/unpaid_hours_recruiter_services.dart';

class UnpaidHoursRecruiterViewModel extends GetxController {
  final dateController = TextEditingController();
  final unpaidHoursController = TextEditingController();
  final commentController = TextEditingController();
  final parkingTravelController = TextEditingController();
  final generalExpController = TextEditingController();

  RxString pickedDate = ''.obs;

  Future<bool> submitUnpaidRecruiterHours(
      {required int workerId,
      required int unpaidHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required String date,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await UnpaidHoursRecruiterServices()
        .unpaidSubmitHoursRecruiterServices(
            workerId: workerId,
            date: date,
            generalExpValue: generalExpValue,
            jobSiteID: jobSiteID,
            parkingTravelValue: parkingTravelValue,
            unpaidHours: unpaidHours,
            jobSite: jobSite,
            feedBack: feedBack,
            generalExpImage: generalExpImage,
            parkingTravelImage: parkingTravelImage);
    return isSuccess;
  }
}
