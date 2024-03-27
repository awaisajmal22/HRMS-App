import 'package:get/get.dart';
import 'package:hrmsapp/WorkerApp/WeeklyWorkSummaryModule/Model/weekly_work_summary_worker_id.dart';

import '../Model/weekly_work_summary_model.dart';
import '../Services/weekly_work_summary_services.dart';

class WeeklyWorkSummaryViewModel extends GetxController {
  RxInt selectedCurrentSummaryIndex = (-1).obs;
  RxList<WeeklyWorkSummaryModel> weeklyWorkList =
      <WeeklyWorkSummaryModel>[].obs;
  Future<List<WeeklyWorkSummaryModel>> getweeklyWorkSummary() async {
    final data =
        await WeeklyWorkSummaryServices().getWeeklyWorkSummaryServices();
    if (data != null) {
      weeklyWorkList.value = data;

      print(weeklyWorkList.length);
    }
    return data;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getweeklyWorkSummary();
  }

  Future<WeeklyWorkSummaryWorkerByIdModel> getWorkerSummaryByID(
      {required int id}) async {
    WeeklyWorkSummaryWorkerByIdModel model = await WeeklyWorkSummaryServices()
        .getWeeklyWorkSummaryWorkerServicesByID(id: id);
    // print(model);
    // getDailyWorkSummary(
    //   workerId:
    // );
    return model;
  }

  RxList<WeeklyWorkSummaryModel> newWeeklyWorkList =
      <WeeklyWorkSummaryModel>[].obs;
  getWeeklySummaryByJobSite(String query) {
    newWeeklyWorkList.clear();
    for (int i = 0; i < weeklyWorkList.length; i++) {
      if (weeklyWorkList[i].jobSiteName == query) {
        newWeeklyWorkList.add(weeklyWorkList[i]);
      }
    }
  }
}
