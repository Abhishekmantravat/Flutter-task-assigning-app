import 'package:flutter/material.dart';
import 'package:taskmanagement/screen/signupbuttonwidget.dart';
import 'package:taskmanagement/screen/signupform_widget.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
    child: Container(
    padding: EdgeInsets.all(30),
    child: Column(
    children: [

             SignUpFormWidget(),
      SignUpButtonWidget(
        onTap:(){} ,
        title:"Already have an Account" ,
        subtitle: "SignIn",
      )
    ],
    ),
    ),
    ),



    );
  }
}
