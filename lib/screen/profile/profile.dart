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
                print(uid);
              },
            );
          },
        ),
      ),
      body: Container(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final docs = snapshot.data?.docs;

                  return Column(
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

// make a chat functionality

// class chat extends StatefulWidget {
//   const chat({super.key});

//   @override
//   State<chat> createState() => _chatState();
// }

// class _chatState extends State<chat> {
//   List<Chatuser> list = [];

//   Widget build(BuildContext context) {
//     mq = MediaQuery.of(context).size;
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: FloatingActionButton(
//           onPressed: () {
           
         
//           },
//           child: const Icon(Icons.add_comment_rounded),
//         ),
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("users").snapshots(),
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               // check firebase data is loding
//               case ConnectionState.waiting:
//               case ConnectionState.none:
//                 return const Center(child: CircularProgressIndicator());

//               // check data loaded
//               case ConnectionState.active:
//               case ConnectionState.done:

//                 // if (snapshot.hasData) {
//                 final data = snapshot.data?.docs;
//                 list = data?.map((e) => Chatuser.fromJson(e.data())).toList() ??
//                     [];
//                 print(list[0]);
            

//                 //  check user is not empty
//                 if (list.isNotEmpty) {
//                   return ListView.builder(
//                       itemCount: list.length,
//                       padding: EdgeInsets.only(top: mq.height * .02),
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return Chat_user_card(user: list[index]);

//                         //show name data in firebase
//                         // return Text("name :${data[index]['name']}");
//                       });

//                   // user is empty show no collection found
//                 } else {
//                   return const Center(
//                     child: Text(
//                       "No Collection Found",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 }
//             }
//           }),
//     );
//   }
// }


