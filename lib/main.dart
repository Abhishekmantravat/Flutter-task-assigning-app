import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taskmanagement/screen/signup_screen.dart';
import 'package:taskmanagement/services/authentication.dart';
import 'package:taskmanagement/utils/theme/theme.dart';
import 'package:get/get.dart';

Future<void> main() async {
  //initializing the firebase
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCcotkto_SbUDEJ3vKHSuznUK6GAtab6ok",
          authDomain: "mantravat-intern.firebaseapp.com",
          appId:"1:1076543723806:web:fe12d6d3d350628b79110f" ,
          messagingSenderId:"1076543723806" ,
          projectId: "mantravat-intern",
          measurementId: "G-TD6GQKCP0S",
          storageBucket: "mantravat-intern.appspot.com",)
    ).then((value) => Get.put(AuthenticationRepository()));
  }else{
    await Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));

  }
  runApp(const MyApp());
}
// apiKey: "AIzaSyCcotkto_SbUDEJ3vKHSuznUK6GAtab6ok",
// authDomain: "mantravat-intern.firebaseapp.com",
// projectId: "mantravat-intern",
// storageBucket: "mantravat-intern.appspot.com",
// messagingSenderId: "1076543723806",
// appId: "1:1076543723806:web:fe12d6d3d350628b79110f",
// measurementId: "G-TD6GQKCP0S"
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      //defining themes for app
      theme: TAppTheme.lightTheme,
        darkTheme:TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
      home: const SignUpScreen(),
    );
  }
}

