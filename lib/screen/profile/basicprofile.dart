import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/screen/profile/show_profile.dart';


void updateCollection() async {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("users").doc(uid).collection("user profile");
  final DocumentReference documentReference = collectionReference.doc(uid);

  try {
    await documentReference.update({
      'field1': 'updated value',
      'field2': 42,
    });
    print('Document updated successfully!');
  } catch (e) {
    print('Error updating document: $e');
  }
}




//  class basic information

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
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
    _nameController = TextEditingController(text: "John");
    _emailController = TextEditingController(text: "email");
    _phoneController = TextEditingController(text: "555-555-5555");

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
        leading: const Icon(Icons.arrow_back),
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
              Text(uid),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _nameController,
                      readOnly: false,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
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
              const Text('Email:'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _emailController,
                      readOnly: false,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(),
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
              const Text('Phone:'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
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
              const Text('Address:'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _addressController,
                      // initialValue: " ",
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
                      controller: _genderController,
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
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff17203A))),
                  onPressed: () async {
                    var time = DateTime.now().second;
                    await FirebaseFirestore.instance
                        .collection("users")
                        .doc(uid)
                        .collection('user profile')
                        .add({
                      // "id": currentUser!.uid,
                      "name": _nameController.text.toString(),
                      "email": _emailController.text.toString(),
                      "phone": _phoneController.text.toString(),
                    });
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