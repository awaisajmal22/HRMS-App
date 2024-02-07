import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../../../Utils/toast_message.dart';
import '../Model/weekly_hours_recruiter_model.dart';

class WeeklyRecruiterServices {
  Future<bool> weeklySubmitHoursRecruiterServices({
    required String startDate,
    required String endDate,
    required int workerId,
    required double totalHours,
    required String jobSite,
    required double generalExpValue,
    required double parkingTravelValue,
    required String parkingTravelImage,
    required String generalExpImage,
    required String feedBack,
    required int jobSiteID,
  }) async {
    bool isSuccess = false;
    try {
      // if(parkingTravelImage != null || parkingTravelImage != '' &&  generalExp != null || generalExp != '')
      // {var bytes = await rootBundle.load(parkingTravelImage);
      // var buffer = bytes.buffer;
      // var parkingTravel =
      //     buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      // var bytes2 = await rootBundle.load(generalExp);
      // var buffer2 = bytes.buffer;
      // var generalExpanse =
      //     buffer2.asUint8List(bytes2.offsetInBytes, bytes2.lengthInBytes);}
      if (parkingTravelImage.isNotEmpty && generalExpImage.isNotEmpty) {
        FormData data = FormData.fromMap({
          "WorkerId": workerId.toString(),
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
            .postRequestHeader(ApiUrl.recruiterAddWeeklyHoursURL, data);
        print(response);
        if (response == null) {
        } else if (response.statusCode == 200) {
          print(response);
          isSuccess = true;
        } else {
          toast(
            msg: response.data.toString(),
          );
        }
      } else {
        FormData data = FormData.fromMap({
          "WorkerId": workerId.toString(),
          "Thours": totalHours,
          "Parking": parkingTravelValue ?? 0.0,
          "Genexpence": generalExpValue ?? 0.0,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response = await API()
            .postRequestHeader(ApiUrl.recruiterAddWeeklyHoursURL, data);
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
