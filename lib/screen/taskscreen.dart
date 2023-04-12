import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constant/colors.dart';
import 'addtask.dart';
import 'description.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String uid = '';
  @override
  void initState() {
    getuid();
    super.initState();
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser!;
    setState(() {
      uid = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL TASKS'),
        backgroundColor: tSecondaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {}
              // async {
              //   await FirebaseAuth.instance.signOut();
              //   Get.back();
              // }
              ),
        ],
      ),
    body: Container(
        padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tasks')
            .doc(uid)
            .collection('mytasks')
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
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: tSecondaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(docs![index]['title'],
                        style: const TextStyle(
                          color: tWhiteColor,
                          fontSize: 16,)),
                      )
                    ],),
                  );
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  // body: Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: MediaQuery.of(context).size.height,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: StreamBuilder(
                  //     stream: FirebaseFirestore.instance
                  //         .collection('tasks')
                  //         .doc(uid)
                  //         .collection('mytasks')
                  //         .snapshots(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return Center(
                  //           child: CircularProgressIndicator(),
                  //         );
                  //       } else {
                  //         final docs = snapshot.data?.docs;
                  //
                  //         return ListView.builder(
                  //           itemCount: docs?.length,
                  //           itemBuilder: (context, index) {
                  //             var time = (docs![index]['timestamp'] as Timestamp).toDate();
                  //
                  //             return InkWell(
                  //               onTap: () {
                  //                 Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) => Description(
                  //                           title: docs[index]['title'],
                  //                           description: docs[index]['description'], key: null,
                  //                         )));
                  //               },
                  //               child: Container(
                  //                 margin: EdgeInsets.only(bottom: 10),
                  //                 decoration: BoxDecoration(
                  //                     color: Color(0xff121211),
                  //                     borderRadius: BorderRadius.circular(10)),
                  //                 height: 90,
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Column(
                  //                         mainAxisAlignment: MainAxisAlignment.center,
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Container(
                  //                               margin: EdgeInsets.only(left: 20),
                  //                               child: Text(docs[index]['title'],
                  //                                   style:
                  //                                   GoogleFonts.roboto(fontSize: 20))),
                  //                           SizedBox(
                  //                             height: 5,
                  //                           ),
                  //                           Container(
                  //                               margin: EdgeInsets.only(left: 20),
                  //                               child: Text(
                  //                                   DateFormat.yMd().add_jm().format(time)))
                  //                         ]),
                  //                     Container(
                  //                         child: IconButton(
                  //                             icon: Icon(
                  //                               Icons.delete,
                  //                             ),
                  //                             onPressed: () async {
                  //                               await FirebaseFirestore.instance
                  //                                   .collection('tasks')
                  //                                   .doc(uid)
                  //                                   .collection('mytasks')
                  //                                   .doc(docs[index]['time'])
                  //                                   .delete();
                  //                             }))
                  //                   ],
                  //                 ),
                  //               ),
                  //             );
                  //           },
                  //         );
                  //       }
                  //     },
                  //   ),
                  //   // color: Colors.red,
                  // ),
                  // floatingActionButton: FloatingActionButton(
                  //     child: Icon(Icons.add, color: Colors.white),
                  //     backgroundColor: Theme.of(context).primaryColor,
                  //     onPressed: () {
                  //       Navigator.push(
                  //           context, MaterialPageRoute(builder: (context) => AddTask()));
                  //     }),
                }
            );
          }
        })),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: tSecondaryColor,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddTask()));
          }),

    )



    ;}}