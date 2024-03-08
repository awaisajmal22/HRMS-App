import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../EditDailyTotalHoursRecruiterModule/ViewModel/edit_daily_total_hours_recruiter_view_model.dart';
import '../Model/daily_work_summary_recruiter_model.dart';
import '../Services/daily_work_summary_recruiter_services.dart';

class DailyWorkSummaryRecruiterViewModel extends GetxController {
  RxInt selectedDailySummaryIndex = (-1).obs;
  final pageController = PageController();
  RxString week = 'Week 1'.obs;
  RxInt pageChanged = 0.obs;
  RxList weekList = [
    'Week 1',
  ].obs;
  bool isSuccess = false;
  RxList<DailyWorkSummaryRecruiterModel> dailyWorkList =
      <DailyWorkSummaryRecruiterModel>[].obs;
  Future<List<DailyWorkSummaryRecruiterModel>> getRecruiterDailyWorkSummary({
    required int workerId,
  }) async {
    dailyWorkList.clear();
    final data = await DailyWorkSummaryRecruiterServices()
        .getDailyWorkSummaryRecruiterServices(workerId: workerId);
    print(workerId);
    if (data.isNotEmpty) {
      dailyWorkList.value = data;

      print(dailyWorkList.length);
    }
    return data;
  }

  Future<bool> submitDailyRecruiterHours({required int workerId}) async {
    bool isSuccess = await DailyWorkSummaryRecruiterServices()
        .submitDailyRecruiterWorkSummary(workerID: workerId);
    return isSuccess;
  }

  Future<DailyWorkSummaryRecruiterByIdModel> getRecruiterSummaryByID(
      {required int id}) async {
    DailyWorkSummaryRecruiterByIdModel model =
        await DailyWorkSummaryRecruiterServices()
            .getDailyWorkSummaryRecruiterServicesByID(id: id);
    // getDailyWorkSummary(
    //   workerId:
    // );
    return model;
  }

  Future<bool> deleteSpecificData({required int id}) async {
    final isSuccess = await DailyWorkSummaryRecruiterServices()
        .deleteDailyRecruiterWorkSummary(id: id);
    return isSuccess;
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
