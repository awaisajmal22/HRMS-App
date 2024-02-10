import 'package:get/get.dart';


import 'package:hrmsapp/RecruiterApp/UnpaidRecruiterHoursSummaryModule/Model/unpaid_recruiter_summary_model.dart';
import 'package:hrmsapp/RecruiterApp/UnpaidRecruiterHoursSummaryModule/Services/unpaid_recuiter_summary_services.dart';

class UnpaidRecruiterSummaryViewModel extends GetxController{
  RxInt selectCurrentSummaryIndex = (-1).obs;
RxList<UnpaidRecruiterWorkSummaryModel> unpaidWorkList =
      <UnpaidRecruiterWorkSummaryModel>[].obs;
  Future<List<UnpaidRecruiterWorkSummaryModel>> getRecruiterUnpaidWorkSummary({
    required int workerId,
  }) async {
    final data = await UnpaidRecruiterSummaryServices()
        .getUnpaidRecruiterWorkSumamryData(workerId: workerId);
    print(data);
    if (data != null) {
      unpaidWorkList.value = data;

      print(unpaidWorkList.length);
    }
    return data;
  }

}