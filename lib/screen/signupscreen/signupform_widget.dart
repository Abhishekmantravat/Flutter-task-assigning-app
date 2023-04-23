import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/services/authentication.dart';
import '../../constant/sizes.dart';
import '../../controller/signupcontroller.dart';

class SignUpFormWidget extends StatelessWidget {

  var fullName;
  var email;
  var phoneNo;
  var password;

   SignUpFormWidget({super.key, 
  
  this.fullName,
  this.email,
  this.password,
  this.phoneNo,
  });

  @override
  Widget build(BuildContext context) {
    //creating the instance of signupcontroller to use its properties
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.only(top: 300),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                  label: Text("Full Name"),
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                  label: Text("Phone No"),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: tFormHeight - 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()  async{
                      // using the method to authenticate user
                      SignUpController.instance.registerUser(
                          controller.fullName.text.trim(),
                          controller.email.text.trim(),
                          controller.password.text.trim(),
                          controller.phoneNo.text.trim());


                           
         
          
                    },
                    child: Text("SignUp".toUpperCase())),
              )
            ],
          )),
    );
  }
}
