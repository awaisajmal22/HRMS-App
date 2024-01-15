import 'package:get/get.dart';
import 'package:hrmsapp/Constant/Model/response_model.dart';
import 'package:hrmsapp/AuthModule/OtpModule/services/otp_services.dart';

class OtpViewModel extends GetxController{
  RxString verificationCode = ''.obs;

  Future<ResponseModel> getOtpVerificationResponse({required String email, required String verificationCode}) async {
    ResponseModel otpResponseModel = await otpVerificationServices(email: email, verificationCode: verificationCode);
    return otpResponseModel;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}