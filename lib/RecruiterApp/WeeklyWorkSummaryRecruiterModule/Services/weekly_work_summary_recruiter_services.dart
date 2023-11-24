import 'dart:convert';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/weekly_work_summary_recruiter_model.dart';

class WeeklyWorkSummaryRecruiterServices {
  Future<List<WeeklyWorkSummaryRecruiterModel>>
      getWeeklyWorkSummaryRecruiterServices({required int workerId}) async {
    bool? isSuccess = false;
    List<WeeklyWorkSummaryRecruiterModel> weeklyWorkSummaryList = [];
    try {
      var response = await API()
          .getRequestHeader("${ApiUrl.recruiterweeklyworksummaryURL}$workerId");
      print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        isSuccess = true;
        // print(jobSites.length);

        String encodedData = jsonEncode(data.response!.data);
        print('encoded');
        List<dynamic> decodedData = jsonDecode(encodedData);
        List<WeeklyWorkSummaryRecruiterModel> dataList = decodedData
            .map((map) => WeeklyWorkSummaryRecruiterModel.fromJson(map))
            .toList();
        // weeklyWorkSummaryList.add(WeeklyWorkSummaryRecruiterModelFromJson(encodedData));

        dataList.forEach((d) {
          weeklyWorkSummaryList.add(d);
        });
        print('ok');
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
