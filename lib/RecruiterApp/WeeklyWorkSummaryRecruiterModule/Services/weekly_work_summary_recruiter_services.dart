import 'dart:convert';

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
      var response = await http.get(Uri.parse("${ApiUrl.recruiterweeklyworksummaryURL}$workerId"));
     
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
}
