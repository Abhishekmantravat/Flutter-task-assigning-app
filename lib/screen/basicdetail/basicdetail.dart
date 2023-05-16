import 'package:flutter/material.dart';
// for use dob_input_field
import 'package:dob_input_field/dob_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';

import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:taskmanagement/screen/homescreen/home_view.dart';

final _auth = FirebaseAuth.instance;

class basicdetail extends StatefulWidget {
  const basicdetail({super.key});

  @override
  State<basicdetail> createState() => _basicdetailState();
}

class _basicdetailState extends State<basicdetail> {
  late TextEditingController dobController;
  late TextEditingController roleController;

  void initState() {
    super.initState();
    // Initialize text controllers with previous values

    dobController = TextEditingController(text: "");
    roleController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2.0, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            iconSize: 25,
                            color: Colors.white,

                            tooltip: "change picture",

                            // backgroundColor: const Color(0xff94d500),
                            mouseCursor: SystemMouseCursors.click,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedBackgroundText(
                      'Add information',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      backgroundColor: iconcolor,
                      innerRadius: 15.0,
                      outerRadius: 10.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                Text("D.O.B",
                    style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  children: [
                    Expanded(
                      child:

                          // InputDecoration(
                          //   hintText: 'Enter Lucky DOB',
                          //   focusedBorder: const OutlineInputBorder(
                          //     borderSide: BorderSide(
                          //         color: Color.fromARGB(255, 102, 107, 120)),
                          //   ),

                          // ),

                          DOBInputField(
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        showLabel: true,
                        inputDecoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                        dateFormatType: DateFormatType.DDMMYYYY,
                        autovalidateMode: AutovalidateMode.always,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('ROLE:', style: TextStyle(color: textcolor)),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: roleController,
                        readOnly: false,
                        decoration: const InputDecoration(
                          hintText: 'Enter your role in company',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff17203A))),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(_auth.currentUser!.email)
                          .update({
                            "role": roleController.text.toString(),
                          }).whenComplete(() =>FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(_auth.currentUser!.email)
                                  .collection("user profile")
                                  .doc(_auth.currentUser!.uid)
                                  .update({
                                "dob": dobController.text.toString(),
                              }))
                          .whenComplete(() => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_view())));
                          // <-- Nested value
                          // .then((_) => FirebaseFirestore.instance
                          //         .collection('users')
                          //         .doc(_auth.currentUser!.email)
                          //         .collection("user profile")
                          //         .doc(_auth.currentUser!.uid)
                          //         .update({
                          //       "dob": dobController.text.toString(),
                          //     }))
                        
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Information Added',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
