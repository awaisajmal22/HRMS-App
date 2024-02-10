import 'dart:convert';

import 'package:hrmsapp/Network/Server/response.dart';
import 'package:hrmsapp/Network/api_service.dart';
import 'package:hrmsapp/Network/api_url.dart';
import 'package:hrmsapp/RecruiterApp/UnpaidRecruiterHoursSummaryModule/Model/unpaid_recruiter_summary_model.dart';

class UnpaidRecruiterSummaryServices {
  getUnpaidRecruiterWorkSumamryData({required int workerId}) async {
    // bool isSuccess = false;
    List<UnpaidRecruiterWorkSummaryModel> unpaidRecruiterWorkSummaryList = [];
    try {
      var response = await API().getRequest(
          "${ApiUrl.unpaidRecruiterSummaryUri}?workerid=$workerId");
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        for(var d in data.response!.data){
          unpaidRecruiterWorkSummaryList.add(UnpaidRecruiterWorkSummaryModel.fromJson(d));
        // });
        }
        print('data is updated');
        print(unpaidRecruiterWorkSummaryList.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return unpaidRecruiterWorkSummaryList;
  }
}
