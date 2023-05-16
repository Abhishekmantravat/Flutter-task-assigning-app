import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/constant/sizes.dart';
import 'package:taskmanagement/screen/about/about.dart';
import 'package:taskmanagement/screen/all_imployee/employeeacountdetail.dart';
import 'package:taskmanagement/screen/profile/basicinfo.dart';
final _auth = FirebaseAuth.instance;

class employeesdetails extends StatefulWidget {

  
const employeesdetails({
    super.key,
    this.name,
    this.email,
  });
  final String? name;
  final String? email;
  
    _employeesdetailsState createState() => _employeesdetailsState();
}

class _employeesdetailsState extends State<employeesdetails> {

  // final String? title;
  // final String? description;
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                  backgroundColor: primaryColor,
        title: Text("Employee Details"),
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
                               
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Text(widget.name!,
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0))),
                            Text(
                              widget.email!,
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
                                  // Get.to(()=>Updateemployeesdetails());
                                },
                                child: const Text(
                                  "All Details",
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
                            Icons.pending_actions_outlined,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            ' Pending tasks ',
                            style: TextStyle(),
                          ),
                          onTap: () {
                           
                          },
                        ),
                        ListTile(
                          textColor: iconcolor,
                          iconColor: iconcolor,
                          hoverColor: hovercolor,
                          leading: const Icon(
                            Icons.task_alt_outlined,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            'Completed Task',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            // basicinfo
                           
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
                            'Personal Details',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => employeeacountdetail(
                                      email: widget.email
                                    )));
                          },
                        ),
                      
                        ListTile(
                          textColor: iconcolor,
                          iconColor: iconcolor,
                          hoverColor: hovercolor,
                          leading: const Icon(
                            Icons.co_present_outlined,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: const Text(
                            'Attendance Details',
                            style: TextStyle(),
                          ),
                          onTap: () {
                            
                          },
                        ),
                      ])));
        
          });
   }
   } ),
    );
  }
}
