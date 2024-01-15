import 'package:hrmsapp/Constant/Model/response_model.dart';
import 'package:hrmsapp/Constant/Toast/fllutter_toast.dart';

import '../../../Network/api_service.dart';
import '../../../Network/api_url.dart';

Future<ResponseModel> otpVerificationServices({
  required String email,
  required String verificationCode,
}) async {
  ResponseModel otpResponseModel = ResponseModel.fromJson({});
  try{
    var data = {
      'email': email,
      'code': verificationCode,
    };
    var response = await API().postRequest(ApiUrl.codeVerificationUrl, data, );
    if(response == null || response.statusCode == 400){
     
    } else if(response.statusCode == 200){
      otpResponseModel = ResponseModel.fromJson(response.data);
    }
  }catch (e) {
    // toast(msg: e.toString());
  }
  return otpResponseModel;
}