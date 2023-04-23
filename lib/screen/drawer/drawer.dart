import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../taskscreen/taskscreen.dart';
class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  drawer: Drawer(
        backgroundColor: const Color(0xff17203A),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color.fromRGBO(23, 32, 58, 1)),
              //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF17203A)),
                accountName: const Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: const Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: const Size.square(50),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 1, 117, 211),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "edit_profile");
                      },
                      child: const Text(
                        "A",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    )), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            const Divider(
              color: Colors.white24,
              height: 1,
            ),

            const SizedBox(height: 10),

            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 102, 185, 213),
              leading: const Icon(
                Icons.manage_accounts,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Text(
                ' Edit Profile ',
                style: TextStyle(),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'edit_profile');
              },
            ),

            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 102, 185, 213),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(Icons.emoji_people),
              title: const Text(' All Employee '),
              onTap: () {
                Navigator.pushNamed(context, 'all_employee');
              },
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 102, 185, 213),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(Icons.task_alt),
              title: const Text(' Task '),
              onTap: () {
                //  use for routes abhishek
                // Navigator.pushNamed(context, 'task');

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskScreen()));
              },
            ),
            ListTile(
              textColor: Colors.white,
              iconColor: Colors.white,
              hoverColor: const Color.fromARGB(255, 102, 185, 213),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              leading: const Icon(Icons.more_time_sharp),
              title: const Text(' Time sheet '),
              onTap: () {
                Navigator.pushNamed(context, 'time_sheet');
              },
            ),
            ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                hoverColor: const Color.fromARGB(255, 102, 185, 213),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}