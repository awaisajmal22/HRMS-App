import 'dart:convert';

import 'package:hrmsapp/Network/Server/response.dart';
import 'package:hrmsapp/Network/api_service.dart';
import 'package:hrmsapp/Network/api_url.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/Model/unpaid_recruiter_summary_model.dart';

class UnpaidSummaryServices {
  getUnpaidWorkSumamryData() async {
    // bool isSuccess = false;
    List<UnpaidWorkSummaryModel> unpaidRecruiterWorkSummaryList = [];
    try {
      var response = await API().getRequestHeader(
          "${ApiUrl.unpaidWorkSummaryUri}");
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        for(var d in data.response!.data){
          unpaidRecruiterWorkSummaryList.add(UnpaidWorkSummaryModel.fromJson(d));
       
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
