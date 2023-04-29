import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/main.dart';

class pro extends StatefulWidget {
  @override
  _proState createState() => _proState();
}

class _proState extends State<pro> {
  List<DocumentSnapshot> studentData = [];

  void getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('user profile')
        .get();
    setState(() {
      studentData = snapshot.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(uid),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              print(uid);
            },
          ),
          const SizedBox(
            width: 15,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: studentData.length,
        itemBuilder: (context, index) {
          if (studentData.isNotEmpty) {
            var gender2;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 120,
                              width: 120,
                              // width: double.infinity,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(mq.height * .3),
                                child: CachedNetworkImage(
                                  width: mq.height * .3,
                                  height: mq.height * .3,
                                  fit: BoxFit.fill,
                                  imageUrl:
                                      studentData[index]['image'],
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          child: Icon(CupertinoIcons.person)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 2.0, bottom: 30),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: 18,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  iconSize: 20,
                                  // color: Colors.white,

                                  tooltip: "change picture",

                                  // backgroundColor: const Color(0xff94d500),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "User Information",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: tSecondaryColor,
                                      backgroundColor: Colors.yellow,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        
                        const SizedBox(height: 20),

                        const Row(
                          children: [
                            Icon(
                              Icons.people,
                            ),
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              studentData[index]['name'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        const Row(
                          children: [
                            Icon(
                              Icons.email,
                            ),
                            Text(
                              "Email Id",
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['email'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.phone,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['phone'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),

                        const Row(
                          children: [
                            Icon(
                              Icons.people,
                            ),
                            Text(
                              'about',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              studentData[index]['about'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.my_location,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['address'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: <Widget>[
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                ),
                                Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 20,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),


                        Row(
                          children: [
                            Icon(
                              gender2 == "male"
                                  ? Icons.male_rounded
                                  : Icons.female_outlined,
                            ),
                            Text(
                              studentData[index]['gender'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.date_range,
                            ),
                            Text(
                              'Date of Birth',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['dob'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.cast_for_education,
                            ),
                            Text(
                              'Education',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['education'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.book_rounded,
                            ),
                            Text(
                              'Skills',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['skill'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_city,
                            ),
                            Text(
                              'Current Location',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['location'],
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.online_prediction,
                            ),
                            Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          studentData[index]['status'],
                          style: const TextStyle(fontSize: 18),
                        ),
                                                const SizedBox(height: 25),

ElevatedButton(
onHover: (value) {
  "sdsd";
},
  onPressed :(){

},
        
          child: const Text("save"),
        
    ),
                                                                    const SizedBox(height: 25),

                      ],
                    ),
                  ),
                ],
              ),
            );

            // user is empty show no collection found
          } else {
            return const Center(
              child: Text(
                "No Collection Found",
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}

// final name = studentData[index]['image'];
