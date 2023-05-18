// // import 'package:flutter/material.dart';
// // import 'dart:async';

// // import 'package:taskmanagement/screen/homescreen/home_view.dart';
// // import 'package:taskmanagement/screen/profile/basicprofile.dart';

// // class attendance extends StatefulWidget {
// //   const attendance({super.key});

// //   @override
// //   State<attendance> createState() => _attendanceState();
// // }

// // class _attendanceState extends State<attendance> {
// //  bool isButtonActive = false;
// //   int remainingTime = 30; // 5 minutes in seconds
// //   @override
// //   void initState() {
// //     super.initState();
// //     activateButton();
// //   }

// //    void activateButton() {
// //     Timer.periodic(Duration(seconds: 1), (timer) {
// //       setState(() {

// //         remainingTime--;
// //  isButtonActive = remainingTime > 0;
// //         final currentTime = DateTime.now();
// //         final activationTime = DateTime(
// //           currentTime.year,
// //           currentTime.month,
// //           currentTime.day,
// //           7, // Hour
// //           2, // Minute
// //           7, // Second
// //         );

// //         isButtonActive = currentTime.isAfter(activationTime);
// //       });
// //        if (remainingTime <= 0) {
// //       timer.cancel();
// //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));    }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: TextButton(onPressed: isButtonActive ? () {
// //           Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_view()));
// //         } : null,
// //           child: Text('Click Me',
// //           style: TextStyle(color: Colors.yellow),),
// // )
// //       ),
// //     );
// //   }
// // }

// //  second page

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:taskmanagement/screen/homescreen/home_view.dart';

import '../../constant/colors.dart';
import '../../model/chat_user.dart';

final _auth = FirebaseAuth.instance;

// class attendance extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Button Activation',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyButtonPage(),
//     );
//   }
// }

// class MyButtonPage extends StatefulWidget {
//   @override
//   _MyButtonPageState createState() => _MyButtonPageState();
// }

// class _MyButtonPageState extends State<MyButtonPage> {
//   bool isButtonActive = false;

//   @override
//   void initState() {
//     super.initState();
//     activateButton();
//   }

//   void activateButton() {
//     Timer(Duration(seconds: 30), () {
//       setState(() {
//         isButtonActive = false;
//       });
//     });
//     setState(() {
//       isButtonActive = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Button Activation'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: isButtonActive ? () {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_view()));
//           } : null,
//           child: Text('Click Me'),
//         ),
//       ),
//     );
//   }
// }

class MyButtonPage extends StatefulWidget {
  @override
  MyButtonPage({
    super.key,
    required this.name,
    this.status,
  });
  final String name;
  final String? status;

  _MyButtonPageState createState() => _MyButtonPageState();
}

class _MyButtonPageState extends State<MyButtonPage> {
  String finalDate = '';

  // getCurrentDate() {
  // var date = new DateTime.now().toString();

  // var dateParse = DateTime.parse(date);

  // var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  //   setState(() {
  //     finalDate = formattedDate.toString();
  //   });
  // }

  bool isButtonActive = false;
  String tooltipmessage = "Time out valide only 9:00 o'clock";
  String message = "Time ";
  // final currentTie = DateTime.now();

  var currentTie = DateTime.now();

  @override
  void initState() {
    super.initState();
    activateButton();
  }

  void activateButton() {
    Timer.periodic(const Duration(minutes: 15), (timer) {
      final currentTime = DateTime.now();
      final activationTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        15, // Hour
        9,
        // Minute
      );

      final endTime = activationTime.add(Duration(minutes: 30));

      if (currentTime.isAfter(activationTime) &&
          currentTime.isBefore(endTime)) {
        setState(() {
          isButtonActive = true;
          tooltipmessage = "set attendance";
        });
      } else {
        setState(() {
          isButtonActive = false;
          tooltipmessage = "Time out valide only 9'o clock";
        });
      }
    });
  }
 
  @override
  void dispose() { 
    
    activateButton();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var date = new DateTime.now().toString();

    // var dateParse = DateTime.parse(date);

    // var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate.toString(),
          // currentTie.day.toString()
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      child: TabBar(
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
                        AttendanceManagementScreen(
                          name: widget.name,
                          status: widget.status,
                          isButtonActive: isButtonActive,
                          tooltipmessage: tooltipmessage,
                        ),
                        todayattendence(
                            isButtonActive: isButtonActive,
                            tooltipmessage: tooltipmessage),
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

class Employee {
  final String name;
  bool isPresent;
  bool isFullDay;
  bool isHalfDay;
  bool isAbsent;
  bool isHalfDayLeave;
  bool isPaidLeave;
  String additionalInfo;

  Employee({
    required this.name,
    this.isPresent = true,
    this.isFullDay = false,
    this.isHalfDay = false,
    this.isAbsent = false,
    this.isHalfDayLeave = false,
    this.isPaidLeave = false,
    this.additionalInfo = '',
  });
}

class AttendanceManagementScreen extends StatefulWidget {
  @override
  AttendanceManagementScreen({
    super.key,
    required this.name,
    this.status,
    this.tooltipmessage,
    required this.isButtonActive,
  });
  final String name;
  final String? status;
  final String? tooltipmessage;
  bool isButtonActive;
  _AttendanceManagementScreenState createState() =>
      _AttendanceManagementScreenState();
}

class _AttendanceManagementScreenState
    extends State<AttendanceManagementScreen> {
  List<Chatuser> list = [];

  List<Employee> employees = [
    Employee(name: " widget.name"),
  ];

  List<String> attendanceOptions = [
    'Present',
    'Full Day',
    'Half Day',
    'Absent',
    'Half Day Leave',
    'Paid Leave',
  ];

  Map<Employee, String> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    int presentCount = employees.where((employee) => employee.isPresent).length;

    return StreamBuilder(
        stream:
            // fetch data in to user collection
            FirebaseFirestore.instance
                .collection('users')
                .doc(_auth.currentUser!.email)
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
                            Employee employee = employees[index];
                            return ListTile(
                              title: Text(widget.name),
                              subtitle: Text(
                                  'Status: ${selectedOptions.containsKey(employee) ? selectedOptions[employee]! : docs![index]["attendance"]}'),
                              trailing: Tooltip(
                                message: widget.tooltipmessage,
                                child: ElevatedButton(
                                  onPressed: widget.isButtonActive
                                      ? () {
                                          _showAttendanceOptionsDialog(
                                              employee);
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: widget.status == "present"
                                        ? Colors.green
                                        : Color.fromARGB(255, 195, 16, 3),
                                  ),
                                  child: Text(
                                    selectedOptions.containsKey(employee)
                                        ? selectedOptions[employee]!
                                        : 'Select',
                                  ),
                                ),
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
                    "No Collection Found",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
              
          }
        });
  }

  void _showAttendanceOptionsDialog(Employee employee) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Today Attendance '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: attendanceOptions
                .map(
                  (option) => ListTile(
                    title: Text(option),
                    onTap: () async {
                      setState(() {
                        selectedOptions[employee] = option;
                        _setAttendance(employee, option);
                      });
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(_auth.currentUser!.email)
                          .collection("attendance")
                          .doc(formattedDate.toString())
                          .update({
                        "attendance": option.trim(),
                      }).whenComplete(() => Navigator.pop(
                              context)); // Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  void _setAttendance(Employee employee, String option) {
    employee.isPresent = true;
    employee.isFullDay = false;
    employee.isHalfDay = false;
    employee.isAbsent = false;
    employee.isHalfDayLeave = false;
    employee.isPaidLeave = false;

    switch (option) {
      case 'Present':
        break;
      case 'Full Day':
        employee.isFullDay = true;
        break;
      case 'Half Day':
        employee.isHalfDay = true;
        break;
      case 'Absent':
        employee.isAbsent = true;
        break;
      case 'Half Day Leave':
        employee.isHalfDayLeave = true;
        break;
      case 'Paid Leave':
        employee.isPaidLeave = true;
        break;
    }
  }
}

class todayattendence extends StatefulWidget {
  todayattendence({
    super.key,
    this.tooltipmessage,
    required this.isButtonActive,
  });
  final String? tooltipmessage;
  bool isButtonActive;

  @override
  State<todayattendence> createState() => _todayattendenceState();
}

class _todayattendenceState extends State<todayattendence> {
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
      // Center(
      //   child: Tooltip(
      //     message: widget.tooltipmessage,
      //     child: ElevatedButton(
      //       onPressed: widget.isButtonActive
      //           ? () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => Home_view()));
      //             }
      //           : null,
      //       child: Text("currentTie.toString()"),
      //     ),
      //   ),
      // ),
    );
  }
}
