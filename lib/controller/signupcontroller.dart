import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/services/authentication.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

//  text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String fullName,String email, String password,String phoneNo){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(fullName,email,password,phoneNo);
  }

}