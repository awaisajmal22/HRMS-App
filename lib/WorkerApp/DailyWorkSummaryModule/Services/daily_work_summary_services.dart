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
        print(data.response!.data);
        isSuccess = true;
        data.response!.data.forEach(
            (d) => dailyWorkSummaryList.add(DailyWorkSummaryModel.fromJson(d)));
            dailyWorkSummaryList.sort((a, b) => a.date.compareTo(b.date));
        print('Data added successfully');
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
    DailyWorkSummaryByIdModel dailyWorkSummaryModel =
        DailyWorkSummaryByIdModel.fromJson({});
    try {
      var response = await API().getRequestHeader(
        "${ApiUrl.getDailySummaryById}$id",
      );
      print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        dailyWorkSummaryModel =
            DailyWorkSummaryByIdModel.fromJson(data.response!.data);

        print("Daily Summary data ${dailyWorkSummaryModel}");
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return dailyWorkSummaryModel;
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

  Future<bool> deleteDailyWorkSummary({required int id}) async {
    bool isSuccess = false;
    print(id);
    try {
   
      final response =
          await API().getRequest( "${ApiUrl.deleteDailyHoursUri}$id");
      print(response.statusCode);
      if (response.statusCode == 200) {
        isSuccess = true;
      }
    } catch (e) {}
    return isSuccess;
  }
}
