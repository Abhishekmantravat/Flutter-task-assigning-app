import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/constant/colors.dart';

import 'package:rounded_background_text/rounded_background_text.dart';
final _auth = FirebaseAuth.instance;

// String name = " ";
// String email = " ";
// String phone = ' ';

//  class basic information

class basicinfo extends StatefulWidget {


  
  // final bool iimage;

  const basicinfo(
      {super.key,

      });

  @override
  State<basicinfo> createState() => _basicinfoState();
}

class _basicinfoState extends State<basicinfo> {

final _formkey = GlobalKey<FormState>();



late TextEditingController _phoneController;
late TextEditingController _imageController;

  late TextEditingController txt;

  // String uid = '';
  String bool = "update";

  void initState() {
    getuid();

    super.initState();
    // Initialize text controllers with previous values
   
    _imageController = TextEditingController(text: "initialvalue");
  }

  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser!;
    setState(() {
      // uid = user.uid ;
      // email = user.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF17203A),
          title: const Text('User Profile'),
        ),
        body: Form(
          key: _formkey,

          
          child:   StreamBuilder(
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

                     final namecontroller= TextEditingController(text: docs![index]['name']);
                  final emailcontroller = TextEditingController(text: docs[index]['email']);
                  final phonenocontroller = TextEditingController(text: docs[index]['phoneno']);


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
                            padding: const EdgeInsets.only(right: 2.0, bottom: 20),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  iconSize: 25,
                                  color: Colors.white,
                
                                  tooltip: "change picture",
                
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
                            'Edit profile',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
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
                      Text(docs[index]['name'],
                          style: TextStyle(
                            color: textcolor,
                            fontWeight: FontWeight.bold,
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: namecontroller , 
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Enter Lucky name',
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 102, 107, 120)),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  tooltip: "change name",
                                ),
                              ),
                               onChanged: (Value) {
                                // setState(() {
                                //   name = Value ;
                               
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Email:', style: TextStyle(color: textcolor)),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: emailcontroller,
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com...',
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 105, 141, 240)),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  tooltip: "change emailId",
                                ),
                              ),
                              onChanged: (_) {
                                // setState(() {
                                //   email = Value;
                               
                                // }
                                // );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Phone.NO:', style: TextStyle(color: textcolor)),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: phonenocontroller,
                              // initialValue: "${widget.pphone}",
                              readOnly: false,
                              decoration: InputDecoration(
                                hintText: 'Enter phone no',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 105, 141, 240)),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  tooltip: "change phone.no",
                                ),
                              ),
                              onTapOutside: (_) {
                                // setState(() {
                                //   phone = _phoneController.text.toString();
                               
                                // });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                            
                      const SizedBox(height: 16),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(const Color(0xff17203A))),
                          onPressed: () async  {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(_auth.currentUser!.uid)
                            .update({
                              "name": namecontroller.text.trim(),
                              "email": emailcontroller.text.trim(),
                              "phoneno": phonenocontroller.text.trim(),
                            })
                            .whenComplete(() => Navigator.pop(context))
                            // <-- Nested value
                            .then((_) => print("profile update"))
                            .catchError((error) => print('Update failed: $error'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Changes saved!',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
              ),

                  );
            }
          );
            }}
      ),
    ),
    ),
    );
  }
}











//  class  personal information edit class

class personalinfo extends StatefulWidget {
  const personalinfo({super.key});

  @override
  State<personalinfo> createState() => _personalinfoState();
}

class _personalinfoState extends State<personalinfo> {


  // String uid = '';
  String email = " ";
  String bool = "update";

  
  getuid() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = await auth.currentUser!;
    setState(() {
      // uid = user.uid ;
      email = user.email!;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: const Text('User Profile'),
      ),
      body:
  StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('users').doc( _auth.currentUser!.uid).collection("user profile").snapshots(),
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
                       final addresscontroller= TextEditingController(text: docs![index]['address']);
                  final gendercontroller = TextEditingController(text: docs[index]['gender']);
                  final dobcontroller = TextEditingController(text: docs[index]['dob']);
                     final educationcontroller= TextEditingController(text: docs[index]['education']);
                  final skillcontroller = TextEditingController(text: docs[index]['skill']);
                  final locationcontroller = TextEditingController(text: docs[index]['location']);
                     final statuscontroller= TextEditingController(text: docs[index]['status']);
                
            return

            SingleChildScrollView(

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
                        padding: const EdgeInsets.only(right: 2.0, bottom: 20),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 20,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              iconSize: 25,
                              color: Colors.white,
        
                              tooltip: "change picture",
        
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
                        'Edit Profile',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
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
                  const Text('Address:'),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: addresscontroller,
                          // initialValue: "sandila",
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          readOnly: false,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
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
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 23),
                  Center(
                      child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff17203A))),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(_auth.currentUser!.uid)
                          .collection("user profile")
                          .doc(_auth.currentUser!.uid) // <-- Doc ID where data should be updated.
                          .update({
                            "address": addresscontroller.text.trim(),
                            "gender": gendercontroller.text.trim(),
                            "dob": dobcontroller.text.trim(),
                            "education": educationcontroller.text.trim(),
                            "skill": skillcontroller.text.toString(),
                            "location": locationcontroller.text.trim(),
                            "status": statuscontroller.text.trim(),
                          })
                          .whenComplete(
                              () => Navigator.pop(context)) // <-- Nested value
                          .then((_) => print("profile update"))
                          .catchError((error) => print('Update failed: $error'));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Changes saved!',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Text("update"),
                  )),
                ],
              ),
            ),
            );
          }
        );
     
     }
  }, )
  
    );
    
  }
}
