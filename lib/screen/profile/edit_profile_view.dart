import 'package:flutter/material.dart';
import 'package:taskmanagement/screen/profile/show_profile.dart';

class UserProfileEditPage extends StatefulWidget {
  const UserProfileEditPage({super.key});

  @override
  UserProfileEditPageState createState() => UserProfileEditPageState();
}

class UserProfileEditPageState extends State<UserProfileEditPage> {
  @override

// future work Abhishek

  // void dispose() {
  //   // Clean up text controllers
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _phoneController.dispose();
  //   _addressController.dispose();
  //   _genderController.dispose();
  //   _dobController.dispose();
  //   _educationController.dispose();
  //   _skillsController.dispose();
  //   _locationController.dispose();
  //   _statusController.dispose();
  //   _imageController.dispose();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return const MaterialApp(
//  call profile class Abhishek
      home: Profile(),
    );
  }
}

//  class Abhishek

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

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with previous values
    _nameController = TextEditingController(text: "John Doe");
    _emailController = TextEditingController(text: "john.doe@example.com");
    _phoneController = TextEditingController(text: "555-555-5555");
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

//                     child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 300,
//                     child: CircleAvatar(
//                       radius:
//                           290, // This radius is the radius of the picture in the circle avatar itself.
//                       backgroundImage: NetworkImage(
//                         "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//                       ),
//                       backgroundColor: Colors.green,
// child: Padding(
// padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
// child: Align(
// alignment: Alignment.bottomRight,
// child: Icon(
// Icons.verified_rounded,
// color: Colors.blue,
// size: 150.0,
// ),),

//                                     )                ),
//                   ),
                  // ),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.white),
                    image: DecorationImage(
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
              const Text('Name:'),
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
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfilePage(
                                    _nameController.text.toString(),
                                    _emailController.text.toString(),
                                    _phoneController.text.toString(),
                                    _addressController.text.toString(),
                                    _genderController.text.toString(),
                                    _dobController.text.toString(),
                                    _educationController.text.toString(),
                                    _skillsController.text.toString(),
                                    _locationController.text.toString(),
                                    _statusController.text.toString(),
                                  )));
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
