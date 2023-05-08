import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/screen/profile/show_profile.dart';

import 'package:rounded_background_text/rounded_background_text.dart';
final _auth = FirebaseAuth.instance;

String name = " ";
String emailid = "";
String phone = ' ';

//  class basic information

class basicinfo extends StatefulWidget {
  final String nname;
  final String eemail;
  final String pphone;
  // final bool iimage;
  final bool update;

  const basicinfo(
      {super.key,
      required this.nname,
      required this.eemail,
      required this.pphone,
      required this.update});

  @override
  State<basicinfo> createState() => _basicinfoState();
}

class _basicinfoState extends State<basicinfo> {
  // void getuserdata() async {
  //   QuerySnapshot snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where("id", isEqualTo: uid)
  //       .get();
  //   setState(() {
  //     userdata = snapshot.docs;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  //   getuserdata();
  // }

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _imageController;

  late TextEditingController txt;

  // String uid = '';
  String email = " ";
  String bool = "update";

  void initState() {
    getuid();

    super.initState();
    // Initialize text controllers with previous values
    txt = TextEditingController(text: " ");

    _nameController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _phoneController = TextEditingController(text: "");
    _imageController = TextEditingController(text: " ");
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,

//

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
              Text("Name:",
                  style: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      readOnly: false,
                      decoration: InputDecoration(
                        hintText: 'Enter Lucky name',
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 105, 141, 240)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                          tooltip: "change name",
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
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
                      controller: _emailController,
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
                      onChanged: (value) {
                        setState(() {
                          emailid = value;
                        });
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
                      controller: _phoneController,
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
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // "name": _nameController.text.toString(),
              //         "email": _emailController.text.toString(),
              //         "phone": _phoneController.text.toString(),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff17203A))),
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(_auth.currentUser!.uid)
                        .update({
                          "name": name,
                          "email": emailid,
                          "phoneno": phone,
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
      ),
      
    );
  }
}











//  class Abhishek

class personalinfo extends StatefulWidget {
  const personalinfo({super.key});

  @override
  State<personalinfo> createState() => _personalinfoState();
}

class _personalinfoState extends State<personalinfo> {

  final TextEditingController _myController = TextEditingController();

  late TextEditingController _addressController;
  late TextEditingController _genderController;
  late TextEditingController _dobController;
  late TextEditingController _educationController;
  late TextEditingController _skillsController;
  late TextEditingController _locationController;
  late TextEditingController _statusController;
  late TextEditingController _imageController;

  // String uid = '';
  String email = " ";
  String bool = "update";

  void initState() {
    getuid();

    super.initState();
    // Initialize text controllers with previous values

    _addressController =
        TextEditingController(text: "123 Main St, Anytown USA");
    _genderController = TextEditingController(text: "Male");
    _dobController = TextEditingController(text: "1990-01-01");
    _educationController =
        TextEditingController(text: "Bachelor's Degree in Computer Science");
    _skillsController =
        TextEditingController(text: "JavaScript, HTML, CSS, PHP, MySQL");
    _locationController = TextEditingController(text: "San Francisco, CA");
    _statusController = TextEditingController(text: "Active");
    _imageController = TextEditingController(text: "/path/to/user/image");
  }

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
// StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection("user Profile").snapshots(),

// builder: (context, snapshot) {
//   if(snapshot.hasData){
// final Service=snapshot.data.docs;
// List<widget>Servicewidget=[];
// for (var profile in Service){
//   final name=profile.data()['name'];
// }

//   }
//   return const  CircularProgressIndicator();
// },
//       );

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
                      controller: _addressController,
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
                      controller: _addressController,
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
                      controller: _dobController,
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
                      controller: _educationController,
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
                      controller: _skillsController,
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
                      controller: _locationController,
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
                      controller: _statusController,
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
                        "address": _addressController.text.toString(),
                        "gender": _genderController.text.toString(),
                        "dob": _dobController.text.toString(),
                        "education": _educationController.text.toString(),
                        "skill": _skillsController.text.toString(),
                        "location": _locationController.text.toString(),
                        "status": _statusController.text.toString(),
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
      ),
    );
  }
}
