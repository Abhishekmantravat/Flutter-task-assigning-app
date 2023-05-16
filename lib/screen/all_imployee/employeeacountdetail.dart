import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/constant/sizes.dart';
import 'package:taskmanagement/screen/about/about.dart';
import 'package:taskmanagement/screen/profile/basicinfo.dart';

final _auth = FirebaseAuth.instance;

class employeeacountdetail extends StatefulWidget {
const employeeacountdetail({
    super.key,
    this.email,
  });
  final String? email;
  @override
  State<employeeacountdetail> createState() => _employeeacountdetailState();
}

class _employeeacountdetailState extends State<employeeacountdetail> {
  // String uid = '';
  List<DocumentSnapshot> usersdata = [];
  List<DocumentSnapshot> usersdatas = [];

  String emails = " ";
  String bool = "update";

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser!;
    setState(() {
      // uid = user.uid ;
      emails = user.email!;
    });
  }

  void getuserdata() async {
    QuerySnapshot snapshot =
        (await FirebaseFirestore.instance.collection("users") .where("email", isEqualTo: widget.email ).get());
    setState(() {
      usersdata = snapshot.docs;
    });
  }

  void getusersdatas() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.email)
        .collection('user profile')
        .get();
    setState(() {
      usersdatas = snapshot.docs;
    });
  }

  void initState() {
    super.initState();
    getusersdatas();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: const Text('Personal Details'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {

            final namecontroller =
                TextEditingController(text: usersdata[index]['name']);
            final emailcontroller =
                TextEditingController(text: usersdata[index]['email']);
            final phonecontroller =
                TextEditingController(text: usersdata[index]['phoneno']);
            final rolecontroller =
                TextEditingController(text: usersdata[index]['role']);
            final addresscontroller =
                TextEditingController(text: usersdatas[index]['address']);
            final gendercontroller =
                TextEditingController(text: usersdatas[index]['gender']);
            final dobcontroller =
                TextEditingController(text: usersdatas[index]['dob']);
            final educationcontroller =
                TextEditingController(text: usersdatas[index]['education']);
            final skillcontroller =
                TextEditingController(text: usersdatas[index]['skill']);
            final locationcontroller =
                TextEditingController(text: usersdatas[index]['location']);
            final statuscontroller =
                TextEditingController(text: usersdatas[index]['status']);
            if (usersdatas.isEmpty) {
                return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2.0, color: Colors.white),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                            ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 2.0, bottom: 20),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  iconSize: 25,
                                  color: Colors.white,

                                  tooltip: widget.email,

                                  // backgroundColor: const Color(0xff94d500),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedBackgroundText(
                            'Add Personal Information',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            backgroundColor: iconcolor,
                            innerRadius: 15.0,
                            outerRadius: 10.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Name:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: namecontroller,
                              // initialValue: "sandila",
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Email Id:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: emailcontroller,
                              // initialValue: "sandila",
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Example@gmail.com',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Phone Number:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: phonecontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '1234567896',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Role:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: rolecontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Software Engineering',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(_auth.currentUser!.uid)
                              .collection("user profile")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              final docs = snapshot.data?.docs;

                              return const Text('Address:');
                            }
                          }),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: addresscontroller,
                              // initialValue: "sandila",
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Address',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Gender:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: gendercontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Male / female',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Date of Birth:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: dobcontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'DD/MM/YYYY',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Education:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: educationcontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Secondary ,senior secondary',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Skills:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: skillcontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Leadership , Management ',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Current Location:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: locationcontroller,
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Location',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Status:'),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: statuscontroller,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'I am present',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            
            }
          }),
    );
  }
}
