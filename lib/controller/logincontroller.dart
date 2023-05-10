import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/services/authentication.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //  text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}
