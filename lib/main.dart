import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taskmanagement/screen/signup_screen.dart';
import 'package:taskmanagement/services/authentication.dart';
import 'package:taskmanagement/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  //initializing the firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

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

