import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/weekly_work_summary_model.dart';

class WeeklyWorkSummaryServices {
  Future<List<WeeklyWorkSummaryModel>> getWeeklyWorkSummaryServices() async {
    bool? isSuccess = false;
    List<WeeklyWorkSummaryModel> weeklyWorkSummaryList = [];
    try {
      var response = await API().getRequestHeader(ApiUrl.weeklyWorkSummaryURL);
      print(response);
      if (response == null) {}
      if (response.statusCode == 200) {
       final data = await ApiResponse.withSuccess(response);
        isSuccess = true;
        // print(jobSites.length);
        data.response!.data.forEach(
            (d) => weeklyWorkSummaryList.add(WeeklyWorkSummaryModel.fromJson(d)));
      }
      // response.data.forEach((d) =>
      //     jobSiteModel.add(JobSiteModel.fromJson(d)));
      // ShowMessage().showMessage("Login Successfully!");
    } catch (e) {
      ApiResponse.withError('error');
    }
    return weeklyWorkSummaryList;
  }
}
