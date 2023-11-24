import 'package:get/get.dart';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/daily_work_summary_model.dart';

class DailyWorkSummaryServices {
  Future<List<DailyWorkSummaryModel>> getDailyWorkSummaryServices() async {
    bool isSuccess = false;
    List<DailyWorkSummaryModel> dailyWorkSummaryList = [];
    try {
      var response = await API().getRequestHeader(
        ApiUrl.getdailyWorkSummaryURL,
      );
      print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        isSuccess = true;
        data.response!.data.forEach(
            (d) => dailyWorkSummaryList.add(DailyWorkSummaryModel.fromJson(d)));

        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return dailyWorkSummaryList;
  }

  Future<DailyWorkSummaryByIdModel> getDailyWorkSummaryServicesByID(
      {required int id}) async {
    Rx<DailyWorkSummaryByIdModel> dailyWorkSummaryModel =
        DailyWorkSummaryByIdModel().obs;
    try {
      var response = await API().getRequestHeader(
        "${ApiUrl.getDailySummaryById}$id",
      );
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        dailyWorkSummaryModel.value =
            DailyWorkSummaryByIdModel.fromJson(data.response!.data);

        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return dailyWorkSummaryModel.value;
  }

  Future<bool> submitDailyWorkSummary() async {
    bool isSuccess = false;
    try {
      final response =
          await API().postRequestHeader(ApiUrl.dailyWorkSummarySubmit, '');
      if (response == null) {
      } else if (response.statusCode == 200) {
        isSuccess = true;
      }
    } catch (e) {
      ApiResponse.withError('error');
    }
    return isSuccess;
  }
}
