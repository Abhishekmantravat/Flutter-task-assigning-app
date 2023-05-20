import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailidontroller = TextEditingController();
  TextEditingController complectiontimeController = TextEditingController();



  // addtasktofirebase() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final user = await auth.currentUser;
  //   String? uid = user?.uid;
  //   var time = DateTime.now();
  //   await FirebaseFirestore.instance
  //       .collection('tasks')
  //       .doc(uid)
  //       .collection('mytasks')
  //       .doc(time.toString())
  //       .set({
  //     'title': titleController.text,
  //     'description': descriptionController.text,
  //     'time': time.toString(),
  //     'timestamp': time
  //   });
  //   Fluttertoast.showToast(msg: 'Data Added');
  //   Get.back();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
        backgroundColor: tSecondaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Column(
              children: [
                Container(
                  child: TextField(
                    controller: emailidontroller,
                    decoration: InputDecoration(
                      labelText: 'Employee email id',
                    ),
                  ),
                ),
                              SizedBox(height: 10),
      
                 Container(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Enter Title',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Enter Description'),
                  ),
                ),
                              SizedBox(height: 10),
      
                 Container(
                  child: TextField(
                    controller: complectiontimeController,
                    decoration: InputDecoration(
                      labelText: 'Enter complection time',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      // style: ButtonStyle(backgroundColor:
                      // MaterialStateProperty.resolveWith<Color>(
                      //         (Set<MaterialState> states) {
                      //       if (states.contains(MaterialState.pressed))
                      //         return Colors.purple.shade100;
                      //       return Theme.of(context).primaryColor;
                      //     })),
                      child: Text(
                        'Add Task',
                        style: GoogleFonts.roboto(fontSize: 18),
                      ),
                      onPressed: () 
                        async{ 
          FirebaseAuth auth = FirebaseAuth.instance;
          final user = await auth.currentUser;
          String? uid = user?.uid;
          var time = DateTime.now();
          await FirebaseFirestore.instance
          .collection('tasks').doc(emailidontroller.text.toString()).
          collection("task").doc(time.toString())
          .set({
        'title': titleController.text,
        'description': descriptionController.text,
        'time': time.toString(),
        'timestamp': time,
        'status':'pending'
          });
          Fluttertoast.showToast(msg: 'Data Added');
          Get.back();
        
                      },
                      
                    ))
              ],
            )),
      ),
    );
  }
}


