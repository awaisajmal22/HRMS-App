import 'dart:convert';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/weekly_work_summary_model.dart';
import 'package:http/http.dart' as http;

class WeeklyWorkSummaryServices {
  Future<List<WeeklyWorkSummaryModel>> getWeeklyWorkSummaryServices() async {
    bool? isSuccess = false;
    List<WeeklyWorkSummaryModel> weeklyWorkSummaryList = [];
    try {
      var response = await API().getRequestHeader(ApiUrl.weeklyWorkSummaryURL);
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        isSuccess = true;
        // print(jobSites.length);
        // var decodedData = jsonDecode(data.response!.data);
        // print(decodedData);
        for (var data in data.response!.data) {
          weeklyWorkSummaryList.add(WeeklyWorkSummaryModel(
              id: data['id'],
              jobId: data['jobId'],
              jobSiteName: data['jobSiteName'],
              hours: data['hours'],
              date: data['date'],
              parking: data['parking'],
              generalexpence: data['generalexpence']));
        }
        print("data add successfully ${weeklyWorkSummaryList.length}");
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return weeklyWorkSummaryList;
  }
}
