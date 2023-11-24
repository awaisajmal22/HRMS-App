import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../WeeklyTotalHoursModule/Model/jobSite_model.dart';
import '../../WeeklyTotalHoursModule/Services/jobsite_services.dart';
import '../Services/unpaid_hours_services.dart';

class UnpaidHoursViewModel extends GetxController {
  final dateController = TextEditingController();
  final unpaidHoursController = TextEditingController();
  final commentController = TextEditingController();
  final parkingTravelController = TextEditingController();
  final generalExpController = TextEditingController();
  
  RxString pickedDate = ''.obs;
  

  
  Future<bool> submitUnpaidHours(
      {
      required int unpaidHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required String date,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await UnpaidHoursServices().unpaidSubmitHoursServices(
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
