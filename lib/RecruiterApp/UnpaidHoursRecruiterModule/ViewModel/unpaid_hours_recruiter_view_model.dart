import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import '../../../WorkerApp/UnpaidHoursModule/Model/last_12_weeks_model.dart';
import '../../WeeklyTotalHoursRecruiterModule/Model/jobSite_recruiter_model.dart';
import '../../WeeklyTotalHoursRecruiterModule/Services/jobsite_recruiter_services.dart';
import '../Services/unpaid_hours_recruiter_services.dart';

class UnpaidHoursRecruiterViewModel extends GetxController {
  final dateController = TextEditingController();
  final unpaidHoursController = TextEditingController();
  final commentController = TextEditingController();
  final parkingTravelController = TextEditingController();
  final generalExpController = TextEditingController();
  RxInt weekNumber = 0.obs;
  RxString pickedDate = DateTime.now().toIso8601String().obs;
  RxInt selectedWeekIndex = 0.obs;
  Future<bool> submitUnpaidRecruiterHours(
      {required int workerId,
      required double unpaidHours,
      required String jobSite,
      required String feedBack,
      double generalExpValue = 0.0,
      required String date,
      required int jobSiteID,
      double parkingTravelValue = 0.0,
      required String generalExpImage,
      required int weeknum,
      required String parkingTravelImage}) async {
    bool isSuccess = await UnpaidHoursRecruiterServices()
        .unpaidSubmitHoursRecruiterServices(
            weekNumber: weeknum,
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

  RxBool isKeyboard = false.obs;
  @override
  void onInit() {
    KeyboardVisibilityController().onChange.listen((event) {
      isKeyboard.value = event;
    });
    getLast12WeeksDataRc();
    // TODO: implement onInit
    super.onInit();
  }

  List<Last12WeeksModel> last12WeekList = <Last12WeeksModel>[];
  Future getLast12WeeksDataRc() async {
    last12WeekList.clear();
    final response =
        await UnpaidHoursRecruiterServices().getLast12WeeksRecruiter();
    response.forEach((element) => last12WeekList.add(element));
    print('weeks List ${last12WeekList.length}');
  }
}
