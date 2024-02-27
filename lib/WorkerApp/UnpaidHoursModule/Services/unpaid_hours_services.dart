import 'package:dio/dio.dart';
import 'package:hrmsapp/WorkerApp/UnpaidHoursModule/Model/last_12_weeks_model.dart';
import 'package:intl/intl.dart';

import '../../../Constant/Toast/fllutter_toast.dart';
import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../../../Utils/toast_message.dart';

class UnpaidHoursServices {
  Future<bool> unpaidSubmitHoursServices({
    required int weekNumber,
    required double unpaidHours,
    required String jobSite,
    required double generalExpValue,
    required double parkingTravelValue,
    required String parkingTravelImage,
    required String generalExpImage,
    required String feedBack,
    required String date,
    required int jobSiteID,
  }) async {
    print("Week Number is $weekNumber");
    bool isSuccess = false;
    try {
      if (parkingTravelImage.isNotEmpty && generalExpImage.isNotEmpty) {
        FormData data = FormData.fromMap({
          // "Date":
          // DateFormat('yyyy-d-M').format(DateTime.parse(date)).toString(),
          "Unpaidhours": unpaidHours,
          "Parking": parkingTravelValue,
          "Genexpence": generalExpValue,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
          "WeekNumber": weekNumber,
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
        var response =
            await API().postRequestHeader(ApiUrl.reportUnpaidHours, data);
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
          // "Date":
          //     DateFormat('yyyy-d-M').format(DateTime.parse(date)).toString(),
          "Unpaidhours": unpaidHours,
          "Parking": parkingTravelValue ?? 0.0,
          "Genexpence": generalExpValue ?? 0.0,
          "Feedback": feedBack,
          "JobsiteId": jobSiteID,
          "WeekNumber": weekNumber,
        });
        print(generalExpImage);
        print(parkingTravelImage);
        var response =
            await API().postRequestHeader(ApiUrl.reportUnpaidHours, data);
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

  Future<List<Last12WeeksModel>> getLast12WeeksWorker() async {
    bool? isSuccess = false;
    List<Last12WeeksModel> last12Weeks = [];
    try {
      var response = await API().getRequestHeader("${ApiUrl.last12WeeksUrl}");
      // print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
        final data = ApiResponse.withSuccess(response);
        isSuccess = true;
        data.response!.data
            .forEach((d) => last12Weeks.add(Last12WeeksModel.fromJson(d)));
        print(last12Weeks);
      }
      // response.data.forEach((d) =>
      //     JobSiteRecruiterModel.add(JobSiteRecruiterModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return last12Weeks;
  }
}
