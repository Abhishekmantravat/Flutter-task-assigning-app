import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../constant/colors.dart';
import 'addtask.dart';
import 'description.dart';

class PendingTask extends StatefulWidget {
  const PendingTask({super.key,
  this.email,});
   final String? email;

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> {
  @override
  final _auth=FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Task'),
        backgroundColor: tSecondaryColor,
      ),
      
      body: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('tasks')
                  .doc(widget.email)
                  .collection('task').where('status',isEqualTo: 'pending')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final docs = snapshot.data?.docs;

                  return ListView.builder(
                      itemCount: docs?.length,
                      itemBuilder: (context, index) {
                        var time =
                            (docs![index]['timestamp'] as Timestamp).toDate();
                        return InkWell(
                          onTap: () {
                            Get.to(() => Description(
                                  title: docs[index]['title'],
                                  description: docs[index]['description'],
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            
                            decoration: BoxDecoration(
                                color: tSecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 

                                   Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(docs[index]['title'],
                                          style: const TextStyle(
                                            color: tWhiteColor,
                                            fontSize: 16,
                                          )),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        DateFormat.yMd().add_jm().format(time),
                                        style: TextStyle(color: tWhiteColor),
                                      ),
                                    )
                                  ],
                                ),
                                // Container(
                                //   child: IconButton(
                                //     icon: const Icon(
                                //       Icons.delete,
                                //       color: Colors.white,
                                //     ),
                                //     onPressed: () async {
                                //       await FirebaseFirestore.instance
                                //           .collection('tasks')
                                //           .doc(uid)
                                //           .collection('mytasks')
                                //           .doc(docs[index]['time'])
                                //           .delete();
                                //     },
                                //   ),
                                // ),
                               
                                
                              
                              ],
                            ),


                          ),
                        );
                      });
                }
              })),
     
    );;;
  }
}