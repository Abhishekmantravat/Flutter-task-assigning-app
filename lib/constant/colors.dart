import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//  get current user collection uid
final FirebaseAuth auth = FirebaseAuth.instance;
final user = auth.currentUser!;
String uid = user.uid;
// String email= user.email!;
//   String? phoneno =user.phoneNumber;
//       String we =user.displayName!;

// List of all colors

const tPrimaryColor = Color(0xffFFE200);
const tSecondaryColor = Color(0xFF1E2552);
// const tAccentColor = Color(0xFF001BFF);

const tWhiteColor = Colors.white;
const tDarkColor = Color(0xff000000);
const tCardBgColor = Color(0xFFF7F6F1);
const tGreyColor = Colors.grey;
 
const iconcolor = Color.fromARGB(255, 0, 0, 0);
const hovercolor=const Color.fromARGB(255, 102, 185, 213);
 
const textcolor = Color.fromARGB(255, 0, 0, 0);

//  FirebaseFirestore.instance.collection('users').doc('USER_ID_HERE')