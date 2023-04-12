import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/model/chat_user.dart';
import 'package:taskmanagement/services/authentication.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

//  text field controllers to get data from textfields

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //creating a function to access authrepository method

  void registerUser(String fullName,String email, String password,String phoneNo){
    AuthenticationRepository.instance.createUserWithEmailAndPassword(fullName,email,password,phoneNo);
  }

}





class Api {
  // for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;

// for firebase storage
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

//   return or create variable and initialized  value
  static User get user => auth.currentUser!;

//for checking if user exists or not?

  static Future<bool> UserExists() async {
    return (await firestore.collection('User').doc(user.uid).get()).exists;
  }

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final ChatUser = Chatuser(
        id: user.uid,
        about: "happy happy",
        email: user.email.toString(),
        lastActive: time,
        name: user.displayName.toString(),
        isonline: false.toString(),
        image: user.photoURL.toString(),
        createdAt: time,
        pushToken: " "
        );
    return await firestore.collection('user').doc(user.uid).set(ChatUser.toJson());
  }
}
