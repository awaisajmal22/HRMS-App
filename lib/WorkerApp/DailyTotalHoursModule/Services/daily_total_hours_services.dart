import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../../../Utils/toast_message.dart';

class DailyHourServices {
  Future<bool> dailySubmitHoursServices({
    required String startTime,
    required String endTime,
    required double totalHours,
    required String date,
    required double generalExpValue,
    required double parkingTravelValue,
    required String parkingTravelImage,
    required String generalExpImage,
    required String feedBack,
    required int jobSiteID,
  }) async {
    bool isSuccess = false;
    try {
      if (parkingTravelImage.isNotEmpty && generalExpImage.isNotEmpty) {
        FormData data = FormData.fromMap({
          "StartTime": startTime,
          "EndTime": endTime,
          "Date":
              DateFormat('yyyy-d-M').format(DateTime.parse(date)).toString(),
          "Parking": parkingTravelValue,
          "Genexpence": generalExpValue,
          "Feedback": feedBack,
          "Parkingdoc": await MultipartFile.fromFile(
            parkingTravelImage,
            filename: parkingTravelImage.split('/').last,
          ),
          "Genexpencedoc": await MultipartFile.fromFile(
            generalExpImage,
            filename: generalExpImage.split('/').last,
          ),
          "Thours": totalHours,
          "JobsiteId": jobSiteID,
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response =
            await API().postRequestHeader(ApiUrl.addDailyHoursURL, data);
        print(response);
        if (response == null) {
        } else if (response.statusCode == 200) {
          print(response);
          isSuccess = true;
        } else {
          toast(msg:response.data.toString());
        }
      } else {
        FormData data = FormData.fromMap({
          "StartTime": startTime,
          "EndTime": endTime,
          "Date": date,
          "Thours": totalHours,
          "Parking": parkingTravelValue ?? 0.0,
          "Genexpence": generalExpValue ?? 0.0,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response =
            await API().postRequestHeader(ApiUrl.addDailyHoursURL, data);
        print(response);
        if (response == null) {
        } else if (response.statusCode == 200) {
          print(response);
          isSuccess = true;
        } else {
          toast(msg:response.data.toString());
        }
      }
    } catch (e) {}
    return isSuccess;
  }
}
