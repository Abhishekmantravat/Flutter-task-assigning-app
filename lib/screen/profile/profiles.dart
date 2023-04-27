import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagement/constant/colors.dart';




class profil extends StatefulWidget {
  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  List<DocumentSnapshot> studentData = [];

  void getData() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').get();
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
        title: Text('Flutterl Firebase Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              // print(name);
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
          var name = studentData[index]['name'];
          return ListTile(
            title: Text(studentData[index]['name']),
            subtitle: Text(studentData[index]['about']),
          );
        },
      ),
    );
  }
}










class pro extends StatefulWidget {
  @override
  _proState createState() => _proState();
}

class _proState extends State<pro> {

  
  List<DocumentSnapshot> studentData = [];


  

  void getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Profile')
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
                  return Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: ${studentData[index]['name']}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Class: ${studentData[index]['Email']}',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Marks: ${studentData[index]['name']}',
                  style: TextStyle(fontSize: 16.0),
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
