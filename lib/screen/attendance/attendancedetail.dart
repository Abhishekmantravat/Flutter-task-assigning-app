import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:taskmanagement/screen/homescreen/home_view.dart';

import '../../constant/colors.dart';
import '../../model/chat_user.dart';

final _auth = FirebaseAuth.instance;

class attendencedetail extends StatefulWidget {
  @override
  attendencedetail({
    super.key,
    required this.email,
    this.name,
    // this.status,
  });
  final String? name;
  final String email;

  _attendencedetailState createState() => _attendencedetailState();
}

class _attendencedetailState extends State<attendencedetail> {
  String finalDate = '';

  String tooltipmessage = "Time out valide only 9:00 o'clock";
  // final currentTie = DateTime.now();

  var currentTie = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //  show user name in appbar 
        '${widget.name}  Attendance'
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      child: const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: 'Today Attendance'),
                          Tab(text: 'Overall Attendance'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.68, //height of TabBarView
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        todayattendance(
                          name: widget.name!,
                          email: widget.email,
                          // status: "widget.status",
                          // tooltipmessage: tooltipmessage,
                        ),
                        overallattendance(tooltipmessage: tooltipmessage),
                        // OverallAttendance(isButtonActive: isButtonActive,tooltipmessage: tooltipmessage),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class todayattendance extends StatefulWidget {
  @override
  todayattendance({
    super.key,
    required this.name,
    required this.email,

    // this.status,
    // this.tooltipmessage,
  });
  final String name;
  final String  email;

  _todayattendanceState createState() => _todayattendanceState();
}

class _todayattendanceState extends State<todayattendance> {
  List<Chatuser> list = [];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            // fetch data in to user collection
            FirebaseFirestore.instance
                .collection('users')
                .doc(widget.email)
                .collection("attendance")
                .where("date", isEqualTo: formattedDate.toString())
                .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // check firebase data is loding
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator());

            // check data loaded
            case ConnectionState.active:
            case ConnectionState.done:
              final docs = snapshot.data?.docs;

              list =
                  docs?.map((e) => Chatuser.fromJson(e.data())).toList() ?? [];
              if (list.isNotEmpty) {
                //  final docs =
                //     snapshot.data?.docs;
                return Scaffold(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(widget.name),
                              subtitle: Text(docs![index]["attendance"]),
                              trailing: Tooltip(
                                message: "wewewe",
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "Employee is not present",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
          }
        });
  }
}

class overallattendance extends StatefulWidget {
  overallattendance({
    super.key,
    this.tooltipmessage,
  });
  final String? tooltipmessage;

  @override
  State<overallattendance> createState() => _overallattendanceState();
}

class _overallattendanceState extends State<overallattendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/images.jpeg'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: 'hello :  ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'tcomment comment the comment comment',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
