import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  var name;
  var email;
  var phoneNumber;
  var address;
  var gender;
  var dateOfBirth;
  var education;
  var skills;
  var currentLocation;
  var status;

  // UserProfilePage(String string, String string2, String string3, String string4, String string5, String string6, String string7, String string8, String string9, String string10, String string11);

  UserProfilePage(
      this.name,
      this.email,
      this.phoneNumber,
      this.address,
      this.gender,
      this.dateOfBirth,
      this.education,
      this.skills,
      this.currentLocation,
      this.status,
      {super.key}
      // this.profileImage,
      );

  @override
  Widget build(BuildContext context) {
    var gender2 = gender;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF17203A),

        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    
                      "https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
                ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xff17203A),
                    onPressed: () {
                      // TODO: Implement profile image upload functionality.
                    },
                    child: const Icon(Icons.edit),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                      ),
                      Text(
                        'name',
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
                        name,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Icon(
                        Icons.email,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                    phoneNumber,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                    address,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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

                  //  call function
                  // leftSection,

                  Row(
                    children: [
                      Icon(
                        gender2 == "male"
                            ? Icons.male_rounded
                            : Icons.female_outlined,
                      ),
                      Text(
                        gender,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
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
                    dateOfBirth,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                    education,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                    skills,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
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
                    currentLocation,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),

                  // try in listTile show information

                  // const ListTile(
                  //   title: Text(
                  //     'hello',
                  //     style: TextStyle(
                  //       fontSize: 20,
                  //      // fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text("hello users"),
                  // ),
                  //                   const SizedBox(height: 16),

                  Row(
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
                    status,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final leftSection = new Container(
  child: new CircleAvatar(
//     backgroundImage: new NetworkImage("https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
// ),

    backgroundColor: Colors.lightGreen,
    radius: 24.0,
  ),
);
