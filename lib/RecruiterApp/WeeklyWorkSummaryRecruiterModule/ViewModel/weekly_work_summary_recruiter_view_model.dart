import 'package:get/get.dart';

import '../Model/weekly_work_summary_recruiter_model.dart';
import '../Services/weekly_work_summary_recruiter_services.dart';

class WeeklyWorkSummaryRecruiterViewModel extends GetxController {
  RxInt selectCurrentSummaryIndex = (-1).obs;
  RxList<WeeklyWorkSummaryRecruiterModel> weeklyWorkList =
      <WeeklyWorkSummaryRecruiterModel>[].obs;
  Future<List<WeeklyWorkSummaryRecruiterModel>> getRecruiterweeklyWorkSummary(
      {required int workerId}) async {
    final data = await WeeklyWorkSummaryRecruiterServices()
        .getWeeklyWorkSummaryRecruiterServices(workerId: workerId);
    if (data != null) {
      weeklyWorkList.value = data;

      print(data);
    }
    return data;
  }
Future<bool> submitWeeklyRecruiterHours({required int workerId}) async {
    bool isSuccess = await WeeklyWorkSummaryRecruiterServices()
        .submitWeeklyRecruiterHours(workerID: workerId);
    return isSuccess;
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getweeklyWorkSummary();
  }
}
