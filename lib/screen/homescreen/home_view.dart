import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/model/chat_user.dart';
import 'package:taskmanagement/screen/all_imployee/all_imployee.dart';
import 'package:taskmanagement/screen/profile/basicprofile.dart';
import 'package:taskmanagement/screen/search/search.dart';
import 'package:taskmanagement/screen/chat/Chat_user_card.dart';
import 'package:taskmanagement/screen/taskscreen/taskscreen.dart';
import 'package:taskmanagement/screen/signupscreen/signup_screen.dart';

import '../profile/basicinfo.dart';

final _auth = FirebaseAuth.instance;

class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
//for storing search status
  bool _isSearching = false;

  // for storing search items

  final List<Chatuser> _searchlist = [];

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
        title: _isSearching
            ? TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintMaxLines: 1,
                    hintText: "search by email",
                    hintStyle: TextStyle(color: Colors.white)),
                autofocus: true,
                style: TextStyle(
                    fontSize: 17, letterSpacing: 0.5, color: Colors.white),
                // when search text changes then updated search list
                onChanged: (value) {
                  //  search login
                  _searchlist.clear();

                  //  for(var i in users){
                  //   if(i.name.toLowerCase().contains(value.toLowerCase()) || i.email.toLowerCase().contains(value.toLowerCase())){
                  //     _searchlist.add(i);
                  //   }
                  //   setState(() {
                  //     _searchlist ;
                  //   });
                  //  }
                },
              )
            : const Text("Mantravat"),
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
            icon: Icon(_isSearching
                ? CupertinoIcons.clear_circled_solid
                : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: Drawer(
          backgroundColor: const Color(0xff17203A),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where("id", isEqualTo: _auth.currentUser!.uid)
                  .snapshots(),
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
                        return Column(
                          children: [
                            DrawerHeader(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(23, 32, 58, 1)),
                              //BoxDecoration
                              child: UserAccountsDrawerHeader(
                                decoration: const BoxDecoration(
                                    color: Color(0xFF17203A)),
                                accountName: Text(
                                  docs![index]['name'],
                                  style: TextStyle(fontSize: 18),
                                ),
                                accountEmail: Text(docs[index]['email']),
                                currentAccountPictureSize:
                                    const Size.square(50),
                                currentAccountPicture: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 1, 117, 211),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                      child: const Text(
                                        "A",
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.white),
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
                              hoverColor:
                                  const Color.fromARGB(255, 102, 185, 213),
                              leading: const Icon(
                                Icons.account_box_rounded,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              title: const Text(
                                ' Profile ',
                                style: TextStyle(),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileScreen()));
                              },
                            ),

                            ListTile(
                              textColor: Colors.white,
                              iconColor: Colors.white,
                              hoverColor:
                                  const Color.fromARGB(255, 102, 185, 213),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.emoji_people),
                              title: const Text(' All Employee '),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => all_employee()));
                              },
                            ),
                            ListTile(
                              textColor: Colors.white,
                              iconColor: Colors.white,
                              hoverColor:
                                  const Color.fromARGB(255, 102, 185, 213),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.task_alt),
                              title: const Text(' Task '),
                              onTap: () {
                                //  use for routes abhishek
                                // Navigator.pushNamed(context, 'task');

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskScreen()));
                              },
                            ),
                            ListTile(
                              textColor: Colors.white,
                              iconColor: Colors.white,
                              hoverColor:
                                  const Color.fromARGB(255, 102, 185, 213),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              leading: const Icon(Icons.more_time_sharp),
                              title: const Text(' Time sheet '),
                              onTap: () {
                                print(_auth.currentUser!.uid);
                              },
                            ),
                            ListTile(
                                textColor: Colors.white,
                                iconColor: Colors.white,
                                hoverColor:
                                    const Color.fromARGB(255, 102, 185, 213),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                leading: const Icon(Icons.logout),
                                title: const Text('LogOut'),
                                onTap: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Get.to(() => SignUpScreen());
                                }),
                          ],
                        );
                      });
                }
              })),
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
  // for storing all users
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
              .where("id", isNotEqualTo: _auth.currentUser!.uid)

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
                print(_auth.currentUser!.uid);

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
