import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/screen/homescreen/home_view.dart';
import 'package:taskmanagement/screen/profile/basicprofile.dart';
import 'package:taskmanagement/screen/signupscreen/signup_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;



  // }
  //creating instance of firebaseauth

  //getting the current login user
  User? currentUser = FirebaseAuth.instance.currentUser;
  //defining method to authenticate the user
  Future<void> createUserWithEmailAndPassword(
      String fullName, String email, String password, String phoneNo) async {
    try {
      //query for the authentication
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // print("user created");
      Get.snackbar('successful', 'you logged in successfully');
      //query to store user data in firestore
      Get.to(() => Home_view());
      var time = DateTime.now().millisecondsSinceEpoch.toString();

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            // .collection('user ')
            //     .doc(uid)
            //  .collection('user')
            .set({
          "id": _auth.currentUser!.uid,
          "name": fullName,
          "email": email,
          "Password": password,
          "phoneno": phoneNo,
        }).whenComplete(()
                // => Future.delayed(const Duration(seconds: 2), ()
                {
          FirebaseFirestore.instance
              .collection("users")
              .doc(_auth.currentUser!.uid)
              .collection('user profile')
              .doc(_auth.currentUser!.uid)
              .set({
            // "id": currentUser!.uid,

            "address": " ",
            "gender": " ",
            "dob": " ",
            "education": " ",
            "skill": "",
            "location": " ",
            "status": "Active",
            "createdAt": fullName,
            "pushToken": " ",
            "lastActive": "time",
            "isonline": "false",
            "image":
                "https://images.pexels.com/photos/1366630/pexels-photo-1366630.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          });
        }
                // ),
                );

        // });
      } catch (exception) {
        Get.snackbar("error", "error in saving data");
      }
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
   Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("signin");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "wrong password",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
   Future<void>logout() async =>  _auth.signOut();
}
