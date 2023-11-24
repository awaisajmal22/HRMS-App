import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewModel extends GetxController {
  RxString name = ''.obs;
  RxString token = ''.obs;
  getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name.value = pref.getString('name') ?? '';
    token.value = pref.getString('token') ?? '';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getName();
    super.onInit();
  }
}
