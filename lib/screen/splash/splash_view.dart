
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmanagement/controller/signupcontroller.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/screen/signup_screen.dart';
// import 'package:mantravat_project/main.dart';
// import 'package:mantravat_project/screens/Home_screen.dart';
// import 'package:mantravat_project/screens/auth/login_screen.dart';

// import '../api/api.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override

  //  show splash screen wait 2 second

   void initState() {
   super.initState();
   Timer(Duration(seconds: 10), () { 
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUpScreen()));
   });
 }
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       // exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setSystemUIOverlayStyle(
//           const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
// Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => SignUpScreen()));
// // check user is login or not if login go to home page
// //       if (Api.auth.currentUser != null) {
// //         // log('\nUser: ${Api.auth.currentUser}' as num);
// //         Navigator.pushReplacement(
// //             context, MaterialPageRoute(builder: (_) => Homescreen()));
// // //  if not login go to login page
// //       } else{
// //         (Navigator.pushReplacement(
// //             context, MaterialPageRoute(builder: (_) => Homescreen())));
// //       // navigate to next screen
// // }
//       //  (Navigator.pushReplacement(
//       //       context, MaterialPageRoute(builder: (_) => loginscreen())));
//     });

//   }
  

  @override
  Widget build(BuildContext context) {
        mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 11, 90, 201),
        child: const Center(
          child: Text("Infotech",
          style: TextStyle(fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
