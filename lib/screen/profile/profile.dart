// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:taskmanagement/constant/colors.dart';
// import 'package:taskmanagement/main.dart';
// import 'package:taskmanagement/model/chat_user.dart';
// import 'package:taskmanagement/screen/search/search.dart';
// import 'package:taskmanagement/screen/taskscreen/taskscreen.dart';

// class profile extends StatefulWidget {
//   final Chatuser user;

//   const profile({super.key, required this.user});

//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     mq = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: tSecondaryColor,
//         title: const Text("profile screen"),
//         centerTitle: true,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(
//                 Icons.account_circle,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//       ),
//       drawer: Drawer(
//         backgroundColor: const Color(0xff17203A),
//         child: ListView(
//           padding: const EdgeInsets.all(0),
//           children: [
//             DrawerHeader(
//               decoration:
//                   const BoxDecoration(color: Color.fromRGBO(23, 32, 58, 1)),
//               //BoxDecoration
//               child: UserAccountsDrawerHeader(
//                 decoration: const BoxDecoration(color: Color(0xFF17203A)),
//                 accountName: const Text(
//                   "Abhishek Mishra",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 accountEmail: const Text("abhishekm977@gmail.com"),
//                 currentAccountPictureSize: const Size.square(50),
//                 currentAccountPicture: CircleAvatar(
//                     backgroundColor: const Color.fromARGB(255, 1, 117, 211),
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, "edit_profile");
//                       },
//                       child: const Text(
//                         "A",
//                         style: TextStyle(fontSize: 30.0, color: Colors.white),
//                       ),
//                     )), //circleAvatar
//               ), //UserAccountDrawerHeader
//             ), //DrawerHeader
//             const Divider(
//               color: Colors.white24,
//               height: 1,
//             ),

//             const SizedBox(height: 10),

//             ListTile(
//               textColor: Colors.white,
//               iconColor: Colors.white,
//               hoverColor: const Color.fromARGB(255, 102, 185, 213),
//               leading: const Icon(
//                 Icons.manage_accounts,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               title: const Text(
//                 ' Edit Profile ',
//                 style: TextStyle(),
//               ),
//               onTap: () {
//                 Navigator.pushNamed(context, 'edit_profile');
//               },
//             ),

//             ListTile(
//               textColor: Colors.white,
//               iconColor: Colors.white,
//               hoverColor: const Color.fromARGB(255, 102, 185, 213),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               leading: const Icon(Icons.emoji_people),
//               title: const Text(' All Employee '),
//               onTap: () {
//                 Navigator.pushNamed(context, 'all_employee');
//               },
//             ),
//             ListTile(
//               textColor: Colors.white,
//               iconColor: Colors.white,
//               hoverColor: const Color.fromARGB(255, 102, 185, 213),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               leading: const Icon(Icons.task_alt),
//               title: const Text(' Task '),
//               onTap: () {
//                 //  use for routes abhishek
//                 // Navigator.pushNamed(context, 'task');

//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => TaskScreen()));
//               },
//             ),
//             ListTile(
//               textColor: Colors.white,
//               iconColor: Colors.white,
//               hoverColor: const Color.fromARGB(255, 102, 185, 213),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               leading: const Icon(Icons.more_time_sharp),
//               title: const Text(' Time sheet '),
//               onTap: () {
//                 Navigator.pushNamed(context, 'time_sheet');
//               },
//             ),
//             ListTile(
//                 textColor: Colors.white,
//                 iconColor: Colors.white,
//                 hoverColor: const Color.fromARGB(255, 102, 185, 213),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 leading: const Icon(Icons.logout),
//                 title: const Text('LogOut'),
//                 onTap: () async {
//                   await FirebaseAuth.instance.signOut();
//                   Get.back();
//                 }),
//           ],
//         ),
//       ),
//       body: const Center(
//         child: Text("data"),
//       ),
//     );
//   }
// }

// // // make a chat functionality

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/model/chat_user.dart';

class ProfileScreen extends StatefulWidget {
  // final Chatuser user;
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Chatuser> list = [];

  // String uid = '';
  // @override
  // void initState() {
  //   getuid();
  //   super.initState();
  // }

  // getuid() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final user = await auth.currentUser!;
  //   setState(() {
  //     uid = user.uid;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: const Text("profile screen"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.account_circle,
              ),
              onPressed: () {
                print("uid");
              },
            );
          },
        ),
      ),
      body: Container(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").doc(uid).collection("user profile").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final docs = snapshot.data?.docs;

                  return 
                  
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(mq.height * .3),
                        child: CachedNetworkImage(
                          width: mq.height * .3,
                          height: mq.height * .3,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const CircleAvatar(
                                  child: Icon(CupertinoIcons.person)),
                        ),
                      ),
                    ],
                  );

                  // ListView.builder(
                  //     itemCount: docs?.length,
                  //     itemBuilder: (context, index) {

                  //       return InkWell(
                  //         onTap: () {
                  //           Get.to(() => Description(
                  //                 title: docs?[index]['title'],
                  //                 // description: docs[index]['description'],
                  //               ));
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(bottom: 10),
                  //           decoration: BoxDecoration(
                  //               color: tSecondaryColor,
                  //               borderRadius: BorderRadius.circular(10)),
                  //           height: 90,
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   Padding(
                  //                     padding: const EdgeInsets.all(10),
                  //                     child: Text(docs?[index]['name'],
                  //                         style: const TextStyle(
                  //                           color: tWhiteColor,
                  //                           fontSize: 16,
                  //                         )),
                  //                   ),

                  //                 ],
                  //               ),

                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     });
                }
              })),
    );
  }
}






// // class pro extends StatefulWidget {
// //   @override
// //   _proState createState() => _proState();
// // }

// // class _proState extends State<pro> {
// //   List<DocumentSnapshot> studentData = [];

// //   void getData() async {
// //     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
// //     setState(() {
// //       studentData = snapshot.docs;
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getData();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Flutter Firebase Demo'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: studentData.length,
// //         itemBuilder: (context, index) {
// //           return Container(
// //             padding: EdgeInsets.all(16.0),
// //             margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
// //             decoration: BoxDecoration(
// //               color: Colors.grey[200],
// //               borderRadius: BorderRadius.circular(8.0),
// //             ),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Name: ${studentData[index]['name']}',
// //                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
// //                 ),
// //                 SizedBox(height: 8.0),
// //                 Text(
// //                   'Class: ${studentData[index]['about']}',
// //                   style: TextStyle(fontSize: 16.0),
// //                 ),
// //                 SizedBox(height: 8.0),
// //                 Text(
// //                   'Marks: ${studentData[index]['name']}',
// //                   style: TextStyle(fontSize: 16.0),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
