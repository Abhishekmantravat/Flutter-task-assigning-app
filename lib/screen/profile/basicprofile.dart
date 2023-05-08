import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagement/about/about.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/constant/sizes.dart';
import 'package:taskmanagement/screen/profile/basicinfo.dart';
final _auth = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 

  // for get data in second method

  // void getuserdata() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where("id", isEqualTo: _auth.currentUser!.uid)
  //       .get();
  //   setState(() {
  //     userdata = snapshot.docs;
  //   });
  // }

  @override

  // for get data in second method

  // void initState() {
  //   super.initState();
  //   getData();
  //   getuserdata();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              print(_auth.currentUser!.uid);
            },
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ;
            },
          ),
        ],
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('users').where("id", isEqualTo: _auth.currentUser!.uid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final docs = snapshot.data?.docs;

              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Column(children: [
                        Container(
                          child: Column(children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Text(
                                          "oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo")
                                      //  Image(image: AssetImage(userprofiledata[index]["image"])),
                                      ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: tSecondaryColor,
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit),
                                        iconSize: 20,
                                        color: Colors.white,
                                        tooltip: "change picture",
                                        mouseCursor: SystemMouseCursors.click,
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(docs![index]['name'],
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            Text(
                              docs[index]['email'],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 48, 45, 45)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Get.to(()=>UpdateProfileScreen());
                                },
                                child: const Text(
                                  "Edit picture",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: tSecondaryColor,
                                    side: BorderSide.none,
                                    shape: StadiumBorder()),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                        ListTile(
                          textColor: iconcolor,
                          iconColor: iconcolor,
                          hoverColor: hovercolor,
                          leading: const Icon(
                            Icons.manage_accounts_rounded,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            ' Edit Profile ',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => basicinfo(
                                        
                                        )));
                          },
                        ),
                        ListTile(
                          textColor: iconcolor,
                          iconColor: iconcolor,
                          hoverColor: hovercolor,
                          leading: const Icon(
                            Icons.info_rounded,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            ' Personal information ',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            // basicinfo
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => personalinfo()));
                          },
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          textColor: iconcolor,
                          iconColor: iconcolor,
                          hoverColor: hovercolor,
                          leading: const Icon(
                            Icons.account_box_outlined,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            ' About ',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => aboutscreen()));
                          },
                        ),
                      ])));
        
          });
   }
   } ),
    );
  }
}
