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

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:taskmanagement/screen/homescreen/home_view.dart';


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
  _MyButtonPageState createState() => _MyButtonPageState();
}

class _MyButtonPageState extends State<MyButtonPage> {
  bool isButtonActive = false;
String tooltipmessage = "Time out valide only 9'o clock";
  @override
  void initState() {
    super.initState();
    activateButton();
  }

  void activateButton() {
    Timer.periodic(const Duration(seconds: 144), (timer) {
      final currentTime = DateTime.now();
      final activationTime = DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        10, // Hour
        37,
         // Minute
      );

      final endTime = activationTime.add(Duration(seconds: 60));
      
      if (currentTime.isAfter(activationTime) && currentTime.isBefore(endTime)) {
        setState(() {
          isButtonActive = true;
          tooltipmessage = "set attendance";
        });
      } else {
        setState(() {
          isButtonActive = false;
          tooltipmessage="Time out valide only 9'o clock";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Attdence"),
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
                            Tab(text: 'Today'),
                            Tab(text: 'Overall'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.68, //height of TabBarView
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: TabBarView(
                        children: <Widget>[todayattendence(isButtonActive: isButtonActive,tooltipmessage: tooltipmessage),
                        OverallAttendance(isButtonActive: isButtonActive,tooltipmessage: tooltipmessage),
              
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


// class Employee {
//   final String name;
//   bool isPresent;
//   bool isFullDay;
//   bool isHalfDay;
//   bool isAbsent;
//   bool isHalfDayLeave;
//   bool isPaidLeave;
//   String additionalInfo;

//   Employee({
//     required this.name,
//     this.isPresent = true,
//     this.isFullDay = false,
//     this.isHalfDay = false,
//     this.isAbsent = false,
//     this.isHalfDayLeave = false,
//     this.isPaidLeave = false,
//     this.additionalInfo = '',
//   });
// }

// // class attendances extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Attendance Management',
// //       home: AttendanceHomeScreen(),
// //     );
// //   }
// // }
// class AttendanceManagementScreen extends StatefulWidget {
//   @override
//   _AttendanceManagementScreenState createState() =>
//       _AttendanceManagementScreenState();
// }

// class _AttendanceManagementScreenState
//     extends State<AttendanceManagementScreen> {
//   List<Employee> employees = [
//     Employee(name: 'John Doe'),
//     Employee(name: 'Jane Doe'),
//     Employee(name: 'Bob Smith'),
//   ];

//   List<String> attendanceOptions = [
//     'Present',
//     'Full Day',
//     'Half Day',
//     'Absent',
//     'Half Day Leave',
//     'Paid Leave',
//   ];

//   Map<Employee, String> selectedOptions = {};

//   @override
//   Widget build(BuildContext context) {
//     int presentCount =
//         employees.where((employee) => employee.isPresent).length;

//     return StreamBuilder<Object>(
//       stream: FirebaseFirestore.instance.collection("users").where("id").
//       builder: (context, snapshot) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Attendance Management'),
//           ),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Employees Present Today: $presentCount',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Text(
//                 'Employee List:',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: employees.length,
//                   itemBuilder: (context, index) {
//                     Employee employee = employees[index];
//                     return ListTile(
//                       title: Text(employee.name),
//                       subtitle: Text('Status: ${selectedOptions[employee]}'),
//                       trailing: ElevatedButton(
//                         onPressed: () {
//                           _showAttendanceOptionsDialog(employee);
//                         },
//                         child: Text(
//                           selectedOptions.containsKey(employee)
//                               ? selectedOptions[employee]!
//                               : 'Select',
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }

//   void _showAttendanceOptionsDialog(Employee employee) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Attendance Option'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: attendanceOptions
//                 .map(
//                   (option) => ListTile(
//                     title: Text(option),
//                     onTap: () {
//                       setState(() {
//                         selectedOptions[employee] = option;
//                         _setAttendance(employee, option);
//                       });
//                       Navigator.pop(context);
//                     },
//                   ),
//                 )
//                 .toList(),
//           ),
//         );
//       },
//     );
//   }

//   void _setAttendance(Employee employee, String option) {
//     employee.isPresent = true;
//     employee.isFullDay = false;
//     employee.isHalfDay = false;
//     employee.isAbsent = false;
//     employee.isHalfDayLeave = false;
//     employee.isPaidLeave = false;

//     switch (option) {
//       case 'Present':
//         break;
//       case 'Full Day':
//         employee.isFullDay = true;
//         break;
//       case 'Half Day':
//         employee.isHalfDay = true;
//         break;
//       case 'Absent':
//         employee.isAbsent = true;
//         break;
//       case 'Half Day Leave':
//         employee.isHalfDayLeave = true;
//         break;
//       case 'Paid Leave':
//         employee.isPaidLeave = true;
//         break;
//     }
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:school_management/Screens/Attendance/OverallAttendance.dart';
// import 'package:school_management/Screens/Attendance/TodayAttendance.dart';
// import 'package:school_management/Screens/home.dart';
// import 'package:school_management/Widgets/AppBar.dart';
// import 'package:school_management/Widgets/MainDrawer.dart';
// import 'package:school_management/Widgets/UserDetailCard.dart';

// class Attendance extends StatefulWidget {
//   @override
//   _AttendanceState createState() => _AttendanceState();
// }

// class _AttendanceState extends State<Attendance>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<ScaffoldState> _scaffoldKey =
//         new GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: ( app),
//       // CommonAppBar(
//       //   title: "Attendance",
//       //   menuenabled: true,
//       //   notificationenabled: true,
//       //   ontap: () {
//       //     _scaffoldKey.currentState.openDrawer();
//       //   },
//       // ),
//       drawer: Drawer(
//             elevation: 0,
//             child:
//             //  MainDrawer(),
//           ),
//       body: SingleChildScrollView(
//               child: Column(
//             //crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               UserDetailCard(),
//               DefaultTabController(
//                 length: 2, // length of tabs
//                 initialIndex: 0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                       ),
//                       child: Container(
//                         child: TabBar(
//                           labelColor: Colors.black,
//                           unselectedLabelColor: Colors.black26,
//                           indicatorColor: Colors.black,
//                           tabs: [
//                             Tab(text: 'Today'),
//                             Tab(text: 'Overall'),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: MediaQuery.of(context).size.height*0.68, //height of TabBarView
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10,
//                       ),
//                       child: TabBarView(
//                         children: <Widget>[
//                           // TodayAttendance(),
//                           // OverallAttendance(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//       ),
      
//     );
//   }
// }



class todayattendence extends StatefulWidget {
   todayattendence({super.key,
  this.tooltipmessage,
   this.isButtonActive,

  });
   final String? tooltipmessage;
       bool? isButtonActive;


  @override
  State<todayattendence> createState() => _todayattendenceState();
}

class _todayattendenceState extends State<todayattendence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  Center(
        child: Tooltip(
                            message: widget.tooltipmessage,


          child: ElevatedButton(
          onPressed:  () {
        if(widget.isButtonActive=true){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_view()));

        }
            } ,
        
            child: Text('Click Me'),
          ),
        ),
      ),  
    );
  }
}

class OverallAttendance extends StatefulWidget {

  OverallAttendance({
    super.key,
    this.tooltipmessage,
        this.isButtonActive,

    
  });
  final String? tooltipmessage;
   bool? isButtonActive;

  
  @override
  State<OverallAttendance> createState() => _OverallAttendanceState();
}

class _OverallAttendanceState extends State<OverallAttendance > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Tooltip(
                            message: widget.tooltipmessage,  

          child: ElevatedButton(
            onPressed:  () {
if(widget.isButtonActive=true){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_view()));

}        
            } 
        ,
            child: Text('Click Me'),
          ),
        ),
      ), 
    );
  }
}