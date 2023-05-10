import 'package:flutter/material.dart';
import 'package:taskmanagement/screen/loginscreen/login_screen.dart';
import 'package:taskmanagement/screen/signupscreen/signupbuttonwidget.dart';
import 'package:taskmanagement/screen/signupscreen/signupform_widget.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/screen/taskscreen/taskscreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              SignUpFormWidget(),
              SignUpButtonWidget(
                onTap: () {
                  Get.to(()=>LoginScreen());
                },
                title: "Already have an Account",
                subtitle: "SignIn",
              )
            ],
          ),
        ),
      ),
    );
  }
}
