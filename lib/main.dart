import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmanagement/screen/homescreen/home_view.dart';
import 'package:taskmanagement/screen/profile/edit_profile_view.dart';
import 'package:taskmanagement/screen/signupscreen/signup_screen.dart';
import 'package:taskmanagement/services/authentication.dart';
import 'package:taskmanagement/utils/theme/theme.dart';
import 'package:get/get.dart';

import 'constant/colors.dart';
late Size mq;

Future<void> main() async {
  //initializing the firebase
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (kIsWeb) {
    //  for web fire base connection Abhishek
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyCcotkto_SbUDEJ3vKHSuznUK6GAtab6ok",
      authDomain: "mantravat-intern.firebaseapp.com",
      projectId: "mantravat-intern",
      storageBucket: "mantravat-intern.appspot.com",
      messagingSenderId: "1076543723806",
      appId: "1:1076543723806:web:fc80a37608649ffa79110f",
      measurementId: "G-CPSX3Q16VT",
    )).then((value) => Get.put(AuthenticationRepository()));
  } else {
    //  for android fire base connection connection  priya
    await Firebase.initializeApp()
        .then((value) => Get.put(AuthenticationRepository()));
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;

    return GetMaterialApp(
        title: 'Flutter Demo',
        //defining themes for app
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        // making the route on the basis of current user 
        home:  auth.currentUser==null?SignUpScreen():Home_view(),

        // make a routs to use navigate to another pages
        routes: {
          'homeview': (context) => const Home_view(),
          'edit_profile': (context) => UserProfileEditPage(),
          // 'show_profile':(context) =>   UserProfilePage(),
        });
  }
}
