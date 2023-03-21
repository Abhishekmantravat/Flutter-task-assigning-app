import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //creating instance of firebaseauth
  final _auth = FirebaseAuth.instance;
  //getting the current login user
  User? currentUser= FirebaseAuth.instance.currentUser;
  //defining method to authenticate the user
  Future<void> createUserWithEmailAndPassword(String fullName,String email,
      String password,String phoneNo) async {
    try {
      //query for the authentication
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print("user created");
      //query to store user data in firestore
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