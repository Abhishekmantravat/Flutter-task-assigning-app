import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/model/chat_user.dart';
import 'package:taskmanagement/screen/profile/profiles.dart';
import 'package:taskmanagement/screen/search/search.dart';
import 'package:taskmanagement/screen/chat/Chat_user_card.dart';
import 'package:taskmanagement/screen/taskscreen/taskscreen.dart';

// String uid = " ";

void main() => runApp(const Home_view());

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  List<Chatuser> list = [];

  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    Text("Home screen"),
    // call task screen page
    TaskScreen(),
    // call chat screen page
    chat(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: const Text("Mantravat"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.account_circle,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ));
            },
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contest) => pro()));
              //  Get.to(() => ProfileScreen(
              //       title: docs[index]['title'],
              //       description: docs[index]['description'],
              //     ));
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff17203A),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(23, 32, 58, 1)),
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
                print(uid);
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
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Task',
            activeIcon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// make a chat functionality

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  List<Chatuser> list = [];

  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add_comment_rounded),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")

//  get data to the user profile collection
              // .doc(uid)
              // .collection('user profile')
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

                // if (snapshot.hasData) {
                final data = snapshot.data?.docs;
                list = data?.map((e) => Chatuser.fromJson(e.data())).toList() ??
                    [];
                print(uid);

                //  check user is not empty
                if (list.isNotEmpty) {
                  return ListView.builder(
                      itemCount: list.length,
                      padding: EdgeInsets.only(top: mq.height * .02),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Chat_user_card(user: list[index]);

                        //show name data in firebase
                        // return Text("name :${data[index]['name']}");
                      });

                  // user is empty show no collection found
                } else {
                  return const Center(
                    child: Text(
                      "No Collection Found",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
            }
          }),
    );
  }
}
