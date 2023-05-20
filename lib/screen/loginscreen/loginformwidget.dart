import 'package:flutter/material.dart';
import 'package:taskmanagement/constant/sizes.dart';
import 'package:taskmanagement/controller/logincontroller.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/screen/homescreen/home_view.dart';

class LoginFormWidget extends StatelessWidget {
  var email;
  var password;
  LoginFormWidget({super.key, this.email, this.password});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.only(top: 300),
      child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: tFormHeight - 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      // using the method to authenticate user
                      LoginController.instance.loginUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                          Future.delayed(const Duration(seconds: 5),(){Get.off(()=>Home_view());});
                    },
                    child: Text("SignIn".toUpperCase())),
              )
            ],
          )),
    );
  }
}
