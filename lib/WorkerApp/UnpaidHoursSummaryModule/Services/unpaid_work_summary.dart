import 'dart:convert';

import 'package:hrmsapp/Network/Server/response.dart';
import 'package:hrmsapp/Network/api_service.dart';
import 'package:hrmsapp/Network/api_url.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursSummaryModule/Model/unpaid_recruiter_summary_model.dart';

class UnpaidSummaryServices {
  getUnpaidWorkSumamryData() async {
    // bool isSuccess = false;
    List<UnpaidWorkSummaryModel> unpaidWorkSummaryList = [];
    try {
      var response = await API().getRequestHeader(
          "${ApiUrl.unpaidWorkSummaryUri}");
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        for(var d in data.response!.data){
          unpaidWorkSummaryList.add(UnpaidWorkSummaryModel.fromJson(d));
       
        }
        unpaidWorkSummaryList.sort((a, b) => b.date.compareTo(a.date));
        print('data is updated');
        print(unpaidWorkSummaryList.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return unpaidWorkSummaryList;
  }
}
