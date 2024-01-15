import 'package:dio/dio.dart';
import 'package:hrmsapp/Constant/Toast/fllutter_toast.dart';
import 'package:hrmsapp/Network/api_service.dart';

import '../../../Network/api_url.dart';

class ForgetPassServices{
  Dio dio = Dio();
  Future<bool> forgetPassword({
    
    required String email
  }) async{
    bool isCheck = false;
    try{
     final response = await dio.post("${ApiUrl.forgetPasswordUrl}$email",);
     print("StatusCode ${response.statusCode}");
     if(response == null){
      toast(
        msg: response.data["message"].toString(),
      );
     }
     else if(response.statusCode == 200){
      toast(msg: response.data["message"]);
      isCheck = true;
     }
    }catch(e){
      print(e);
      toast(msg:"No such email is registered");
    }
    return isCheck;
  }
}