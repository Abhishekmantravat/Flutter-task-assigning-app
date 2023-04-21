import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final gendercontroller = TextEditingController();
  final dobcontroller = TextEditingController();
  final educationcontroller = TextEditingController();
  final skillscontroller = TextEditingController();
  final currentLocationcontroller = TextEditingController();
  final currentStatuscontroller = TextEditingController();

  Future profileData({
    required String namecontroller,
    required String emailcontroller,
    required String phonecontroller,
    required String addresscontroller,
    required String gendercontroller,
    required String dobcontroller,
    required String educationcontroller,
    required String skillscontroller,
    required String currentLocationcontroller,
    required String currentStatuscontroller,
  }) {
    final userDocument =
        FirebaseFirestore.instance.collection('users').doc('profile');
        final json = {}
  }
}
