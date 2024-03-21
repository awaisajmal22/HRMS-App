import 'package:get/get.dart';

import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/Model/unpaid_recruiter_summary_model.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/Services/unpaid_work_summary.dart';

class UnpaidSummaryViewModel extends GetxController{
  RxInt selectCurrentSummaryIndex = (-1).obs;
RxList<UnpaidWorkSummaryModel> unpaidWorkList =
      <UnpaidWorkSummaryModel>[].obs;
  Future<List<UnpaidWorkSummaryModel>> getUnpaidWorkSummary(
   
  ) async {
    final data = await UnpaidSummaryServices()
        .getUnpaidWorkSumamryData();
    print(data);
    if (data != null) {
      unpaidWorkList.value = data;

      print(unpaidWorkList.length);
    }
    return data;
  }

}