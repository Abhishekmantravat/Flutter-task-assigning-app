import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/screen/signup_screen.dart';

import '../screen/addtask.dart';
import '../screen/taskscreen.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const SignUpScreen())
        : Get.offAll(() => TaskScreen());
  }
  //creating instance of firebaseauth

  //getting the current login user
  User? currentUser= FirebaseAuth.instance.currentUser;
  //defining method to authenticate the user
  Future<void> createUserWithEmailAndPassword(String fullName,String email,
      String password,String phoneNo) async {
    try {
      //query for the authentication
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // print("user created");
      Get.snackbar('successful','you logged in successfully' );
      //query to store user data in firestore
      Get.to(()=>TaskScreen());
      FirebaseFirestore.instance.collection('users').doc().set({
        "FullName":fullName,
        "Email":email,
        "Password":password,
        "PhoneNo":phoneNo,
        "UserId":currentUser!.uid,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "weak password",
            snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "Email alredy exist",
            snackPosition: SnackPosition.BOTTOM);
      }
    }

  }



}