import 'dart:convert';

import 'package:get/get.dart';
import 'package:hrmsapp/RecruiterApp/WeeklyWorkSummaryRecruiterModule/Model/weekly_work_summary_id_model.dart';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/weekly_work_summary_recruiter_model.dart';
import 'package:http/http.dart' as http;

class WeeklyWorkSummaryRecruiterServices {
  Future<List<WeeklyWorkSummaryRecruiterModel>>
      getWeeklyWorkSummaryRecruiterServices({required int workerId}) async {
    bool? isSuccess = false;
    List<WeeklyWorkSummaryRecruiterModel> weeklyWorkSummaryList = [];
    try {
      var response = await http
          .get(Uri.parse("${ApiUrl.recruiterweeklyworksummaryURL}$workerId"));

      if (response == null) {}
      if (response.statusCode == 200) {
        isSuccess = true;

        var decodedData = jsonDecode(response.body);
        for (var data in decodedData) {
          weeklyWorkSummaryList.add(WeeklyWorkSummaryRecruiterModel(
              id: data['id'],
              jobSiteName: data['jobSiteName'],
              hours: data['hours'],
              date: data['date'],
              parking: data['parking'],
              generalexpence: data['generalexpence']));
        }
        weeklyWorkSummaryList.sort((a, b) => b.date.compareTo(a.date));
        print("weekly Length ${weeklyWorkSummaryList.length}");
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return weeklyWorkSummaryList;
  }

  Future<WeeklyWorkSummaryRecruiterByIdModel>
      getWeeklyWorkSummaryRecruiterServicesByID({required int id}) async {
    Rx<WeeklyWorkSummaryRecruiterByIdModel> weeklyWorkSummaryRecruiterModel =
        WeeklyWorkSummaryRecruiterByIdModel.fromJson({}).obs;
    try {
      var response = await API().getRequestHeader(
        "${ApiUrl.recruiterGetWeeklyWorkSummaryById}$id",
      );
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        // print(data.response!.data);
        weeklyWorkSummaryRecruiterModel.value =
            WeeklyWorkSummaryRecruiterByIdModel.fromJson(data.response!.data);
        print(weeklyWorkSummaryRecruiterModel.value.id);
        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }

    return weeklyWorkSummaryRecruiterModel.value;
  }

  Future<bool> submitWeeklyRecruiterHours({required int workerID}) async {
    print("Recruiter ID $workerID");
    bool isSuccess = false;
    try {
      var data = {
        'WorkerId': workerID,
      };
      final response = await API().postRequest(
          "${ApiUrl.weeklyRecruiterWorkSummarySubmit}?WorkerId=$workerID", '');
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
