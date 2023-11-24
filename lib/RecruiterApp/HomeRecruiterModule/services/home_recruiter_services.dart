import 'dart:convert';

import 'package:get/get.dart';
import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/current_week_recruiter_model.dart';
import '../Model/job_site_recruiter_model.dart';
import '../Model/workers_list_model.dart';

class HomeRecruiterServices {
  Future<CurrentWeekRecruiterDateModel> getCurrentWeekDate() async {
    CurrentWeekRecruiterDateModel currentWeek;
    try {
      var response = await API().getRequest(ApiUrl.getCurrentWeekDateURL);

      if (response == null) {
        throw Exception('No response from the server');
      }

      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        if (data.response != null && data.response?.data != null) {
          currentWeek =
              CurrentWeekRecruiterDateModel.fromJson(data.response?.data);
        } else {
          throw Exception('Data in response is null or empty');
        }

        print(currentWeek);
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error occurred: $e');
    }

    return currentWeek;
  }

  Future<List<WorkersListModel>> getWorkerList() async {
    bool isSuccess = false;
    List<WorkersListModel> workerList = [];
    try {
      var response = await API().postRequestHeader(ApiUrl.getWorkerURL, '');
      print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);

        isSuccess = true;
        List<dynamic> decodedData = jsonDecode(data.response!.data);

        print(decodedData);
        List<WorkersListModel> dataList =
            decodedData.map((map) => WorkersListModel.fromJson(map)).toList();

        dataList.forEach((worker) {
          workerList.add(worker);
        });

        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return workerList;
  }

  Future<List<JobSiteRecruiterModel>> getRecruiterJobSiteServices(
      {required int workerId}) async {
    bool? isSuccess = false;
    List<JobSiteRecruiterModel> jobSites = [];
    try {
      var response = await API().getRequestHeader(
          "${ApiUrl.getRecruiterJobSiteByworkerIdUrl}$workerId");
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        isSuccess = true;
        data.response!.data
            .forEach((d) => jobSites.add(JobSiteRecruiterModel.fromJson(d)));
        // print(jobSites.length);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return jobSites;
  }
}
