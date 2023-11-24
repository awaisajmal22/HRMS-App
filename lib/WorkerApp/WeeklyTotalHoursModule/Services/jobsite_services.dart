import 'package:dio/dio.dart';

import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../../../Utils/toast_message.dart';
import '../Model/jobSite_model.dart';

class ApiServices {
  Future<List<JobSiteModel>> getjobSiteServices() async {
    bool? isSuccess = false;
    List<JobSiteModel> jobSites = [];
    try {
      var response = await API().getRequestHeader(ApiUrl.getJobSiteUrl);
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        isSuccess = true;
        data.response!.data
            .forEach((d) => jobSites.add(JobSiteModel.fromJson(d)));
        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return jobSites;
  }
}
