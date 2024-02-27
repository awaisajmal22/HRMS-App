import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../EditDailyTotalHoursModule/ViewModel/edit_daily_total_hours_view_model.dart';
import '../Model/daily_work_summary_model.dart';
import '../Services/daily_work_summary_services.dart';

class DailyWorkSummaryViewModel extends GetxController {
  RxInt selectedDailySummaryIndex = (-1).obs;
  final pageController = PageController();
  RxString week = 'Week 1'.obs;
  RxInt pageChanged = 0.obs;
  RxList weekList = [
    'Week 1',
  ].obs;

  bool isSuccess = false;
  RxList<DailyWorkSummaryModel> dailyWorkList = <DailyWorkSummaryModel>[].obs;
  Future<List<DailyWorkSummaryModel>> getDailyWorkSummary() async {
    final data = await DailyWorkSummaryServices().getDailyWorkSummaryServices();
    if (data != null) {
      dailyWorkList.value = data;

      print(dailyWorkList.length);
    }
    return data;
  }

  Future<bool> submitDailyHours() async {
    bool isSuccess = await DailyWorkSummaryServices().submitDailyWorkSummary();
    return isSuccess;
  }

  Future<DailyWorkSummaryByIdModel> getSummaryByID({required int id}) async {
    DailyWorkSummaryByIdModel model = await DailyWorkSummaryServices()
        .getDailyWorkSummaryServicesByID(id: id);

    return model;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getDailyWorkSummary();
    super.onInit();
  }
}
