import 'package:get/get.dart';

import '../Model/weekly_work_summary_model.dart';
import '../Services/weekly_work_summary_services.dart';

class WeeklyWorkSummaryViewModel extends GetxController {RxInt selectedCurrentSummaryIndex = (-1).obs;
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
}
