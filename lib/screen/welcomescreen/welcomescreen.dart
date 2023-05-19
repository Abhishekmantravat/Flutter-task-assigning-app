import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/screen/signupscreen/signup_screen.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome Screen',
      theme: ThemeData(),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 4, 48),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/images.jpeg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Mantravat !',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            const Text(
              'A one-stop portal for you to learn the latest ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "technologies from SCRATCH",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
            ),
            const SizedBox(height: 30),
            Container(
              width: 350.0,
              height: 50.0,
              // padding:EdgeInsets.only(left: 80, right: 80) ,
              // margin: EdgeInsets.only(left: 80 , right: 80),
              child: OutlinedButton.icon(
                onPressed: () {
                 Get.to(()=>SignUpScreen());
                },
                
                label: const Text("CONTINUE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 38, 144, 141),
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Click on continue",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
