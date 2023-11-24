import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageHandler extends GetxController {
  final box = GetStorage();

  setToken(String token) {
     box.write('token', token);
  }
  

  setUserData(Map<String, dynamic> myData) {
    String rawJson = jsonEncode(myData);
    print(rawJson);
    box.write('user', rawJson);
  }

  getToken() {
    return box.read('token');
  }

  getUserData() {
    final response = box.read('user');
    return response != null ? jsonDecode(response) : null;
  }

  removeToken() {
    box.remove('token');
  }

  removeCache() async {

    await removeToken();

  }

  removeUserData() {
    box.remove('user');
  }
}
