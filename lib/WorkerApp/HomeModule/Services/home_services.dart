import '../../../Network/Server/response.dart';
import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';
import '../Model/current_week_date_model.dart';

class HomeServices {
 Future<CurrentWeekDateModel> getCurrentWeekDate() async {
  CurrentWeekDateModel currentWeek;
  try {
    var response = await API().getRequest(ApiUrl.getCurrentWeekDateURL);

    if (response == null) {
      throw Exception('No response from the server');
    }

    if (response.statusCode == 200) {
      final data = ApiResponse.withSuccess(response);

      if (data.response != null && data.response?.data != null) {
        currentWeek = CurrentWeekDateModel.fromJson(data.response?.data);
      } else {
        throw Exception('Data in response is null or empty');
      }

      print(currentWeek);
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
    throw Exception('Error occurred: $e');
  }

  return currentWeek;
}


}
