import 'package:hrmsapp/Constant/Model/response_model.dart';
import 'package:hrmsapp/Constant/Toast/fllutter_toast.dart';

import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';

Future<ResponseModel> changePasswordServices({
  required String email,
  required String verificationCode,
  required String password,
}) async {
  ResponseModel responseModel = ResponseModel.fromJson({});
  try{
    var data = {
      'email': email,
      'password': password,
      'code': verificationCode,
    };
    var response = await API().postRequest(ApiUrl.changeUserPasswordUrl, data,);
    print(response.data);
    if(response == null || response.statusCode == 400){
     
    } else if(response.statusCode == 200){
      responseModel = ResponseModel.fromJson(response.data);
    }
  }catch (e) {
    // toast(msg: e.toString());
  }
  return responseModel;
}