import 'package:flutter/material.dart';

//  import firebase_core
import 'package:firebase_core/firebase_core.dart';

//  import firebase_option
import 'firebase_options.dart';

void main() {
  // call firebase function
  _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  show title 
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Center(
                // show text in center
        child: Text("Start Your Journey",
        style: TextStyle(fontSize: 20),),
      ),
    );
  }
}


//  initialize  a firebase function for use firebase
_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}