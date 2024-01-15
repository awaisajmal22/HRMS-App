import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRecruiterViewModel extends GetxController {
  RxBool isEnabledNotification = false.obs;

  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  getUsersData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    userName.value = pref.getString('name') ?? '';
    userEmail.value = pref.getString('email') ?? '';
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsersData();
  }
}
