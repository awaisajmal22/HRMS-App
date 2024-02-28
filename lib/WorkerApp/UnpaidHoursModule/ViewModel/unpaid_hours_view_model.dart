import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursModule/Model/last_12_weeks_model.dart';

import '../../WeeklyTotalHoursModule/Model/jobSite_model.dart';
import '../../WeeklyTotalHoursModule/Services/jobsite_services.dart';
import '../Services/unpaid_hours_services.dart';

class UnpaidHoursViewModel extends GetxController {
  RxInt selectedWeekIndex = 0.obs;
  RxInt weekNumber = (0).obs;
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  RxString startweek = ''.obs;
  RxString endWeek = ''.obs;
  final dateController = TextEditingController();
  final unpaidHoursController = TextEditingController();
  final commentController = TextEditingController();
  final parkingTravelController = TextEditingController();
  final generalExpController = TextEditingController();

  RxString pickedDate = DateTime.now().toIso8601String().obs;

  Future<bool> submitUnpaidHours(
      {required int weeknumber,
      required double unpaidHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required String date,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required String parkingTravelImage}) async {
    bool isSuccess = await UnpaidHoursServices().unpaidSubmitHoursServices(
        weekNumber: weeknumber,
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

  RxBool isKeyboard = false.obs;
  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((event) {
      isKeyboard.value = event;
    });
    getLast12WeeksDataWR();
    // TODO: implement onInit
    super.onInit();
  }

  RxString startYear = ''.obs;
  RxString endYear = ''.obs;
  List<Last12WeeksModel> last12WeekList = <Last12WeeksModel>[];
  Future getLast12WeeksDataWR() async {
    last12WeekList.clear();
    final response = await UnpaidHoursServices().getLast12WeeksWorker();
    response.forEach((element) => last12WeekList.add(element));
    print('weeks List ${last12WeekList.length}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dateController.dispose();
    unpaidHoursController.dispose();
    commentController.dispose();
    parkingTravelController.dispose();
    generalExpController.dispose();
  }
}
