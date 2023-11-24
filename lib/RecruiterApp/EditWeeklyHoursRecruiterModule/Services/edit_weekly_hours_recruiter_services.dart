import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../../../Utils/toast_message.dart';
import '../Model/edit_weekly_hours_recruiter_model.dart';

class EditWeeklyRecruiterServices {
  Future<bool> editweeklyHoursRecruiterServices({
    required String startDate,
    required String endDate,
    required int totalHours,
    required String jobSite,
    required double generalExpValue,
    required double parkingTravelValue,
    required String parkingTravelImage,
    required String generalExpImage,
    required String feedBack,
    required int jobSiteID,
    required int id,
  }) async {
    bool isSuccess = false;
    try {
      if (parkingTravelImage.isNotEmpty && generalExpImage.isNotEmpty) {
        FormData data = FormData.fromMap({
          "Id": id,
          "Thours": totalHours,
          "Parking": parkingTravelValue,
          "Genexpence": generalExpValue,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
          "Parkingdoc": await MultipartFile.fromFile(
            parkingTravelImage,
            filename: parkingTravelImage.split('/').last,
          ),
          "Genexpencedoc": await MultipartFile.fromFile(
            generalExpImage,
            filename: generalExpImage.split('/').last,
          ),
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response = await API()
            .postRequestHeader(ApiUrl.recruiterEditWeeklyHoursURL, data);
        print(response);
        if (response == null) {
        } else if (response.statusCode == 200) {
          print(response);
          isSuccess = true;
        } else {
          toast(msg: response.data.toString());
        }
      } else {
        FormData data = FormData.fromMap({
          "Id": id,
          "Thours": totalHours,
          "Parking": parkingTravelValue,
          "Genexpence": generalExpValue,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response = await API()
            .postRequestHeader(ApiUrl.recruiterEditWeeklyHoursURL, data);
        print(response);
        if (response == null) {
        } else if (response.statusCode == 200) {
          print(response);
          isSuccess = true;
        } else {
          toast(msg: response.data.toString());
        }
      }
    } catch (e) {}
    return isSuccess;
  }
}
