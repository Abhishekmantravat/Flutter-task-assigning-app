import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //  text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();
}
