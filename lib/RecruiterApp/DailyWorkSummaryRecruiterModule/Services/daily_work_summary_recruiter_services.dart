import 'dart:convert';

import 'package:get/get.dart';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/daily_work_summary_recruiter_model.dart';

class DailyWorkSummaryRecruiterServices {
  Future<List<DailyWorkSummaryRecruiterModel>>
      getDailyWorkSummaryRecruiterServices({required int workerId}) async {
    bool isSuccess = false;
    List<DailyWorkSummaryRecruiterModel> dailyWorkSummaryList = [];
    try {
      var response = await API().postRequestHeader(
          "${ApiUrl.getRecruiterDailyHoursSummaryURL}?workerid=$workerId", '');
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        isSuccess = true;
        List<dynamic> decodedData = jsonDecode(data.response!.data);

        List<DailyWorkSummaryRecruiterModel> dataList = decodedData
            .map((map) => DailyWorkSummaryRecruiterModel.fromJson(map))
            .toList();
        print("here $dataList");
        dataList.forEach((data) {
          dailyWorkSummaryList.add(data);
        });
        print('data is updated');
        print(dailyWorkSummaryList.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return dailyWorkSummaryList;
  }

  Future<DailyWorkSummaryRecruiterByIdModel>
      getDailyWorkSummaryRecruiterServicesByID({required int id}) async {
    Rx<DailyWorkSummaryRecruiterByIdModel> DailyWorkSummaryRecruiterModel =
        DailyWorkSummaryRecruiterByIdModel().obs;
    try {
      var response = await API().getRequestHeader(
        "${ApiUrl.recruiterGetDailySummaryById}$id",
      );
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        DailyWorkSummaryRecruiterModel.value =
            DailyWorkSummaryRecruiterByIdModel.fromJson(data.response!.data);

        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return DailyWorkSummaryRecruiterModel.value;
  }

  Future<bool> submitDailyRecruiterWorkSummary({required int workerID}) async {
    bool isSuccess = false;
    try {
     
      final response =
          await API().postRequest("${ApiUrl.dailyRecruiterWorkSummarySubmit}?workerid=$workerID", '');
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
