import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingViewModel extends GetxController {
  RxBool isEnabledNotification = false.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  getPrefData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    name.value = pref.getString('name') ?? '';
    email.value = pref.getString('email') ?? '';
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getPrefData();
    super.onInit();
  }
}
