import 'package:flutter/material.dart';
import 'package:taskmanagement/screen/loginscreen/loginbuttonwidget.dart';
import 'package:taskmanagement/screen/signupscreen/signupform_widget.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/screen/taskscreen/taskscreen.dart';

import '../signupscreen/signup_screen.dart';
import 'loginformwidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              LoginFormWidget(),
              LoginButtonWidget(
                onTap: () {
                  Get.to(()=>SignUpScreen());
                },
                title: "Dont have an Account",
                subtitle: "SignUp",
              )
            ],
          ),
        ),
      ),
    );
  }
}
