import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:taskmanagement/about/about.dart';
import 'package:taskmanagement/screen/profile/basicinfo.dart';

import '../../constant/colors.dart';
import '../../constant/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //  final controller = Get.put(ProfileController());

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(children: [
                  Container(
                    child:
                        // future: controller.getUserData(),
                        // UserModel userData =snapshot.data as UserModel;
                        Column(children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: const Text(
                                    "helbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbnbnbnnbnbnnbnlohelbn")
                                //  Image(image: AssetImage(tProfileImage)),
                                ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 30, height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tSecondaryColor,
                                ),
                                //  child: const Icon(LineAwesomeIcons.alternate_pencil,
                                //  color:Color.fromARGB(255, 231, 231, 231),size: 20,),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                  iconSize: 20,
                                  color: Colors.white,

                                  tooltip: "change picture",

                                  // backgroundColor: const Color(0xff94d500),
                                  mouseCursor: SystemMouseCursors.click,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text("userData.fullName",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0))),
                      Text(
                        "userData.email",
                        style:
                            TextStyle(color: Color.fromARGB(255, 48, 45, 45)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            // Get.to(()=>UpdateProfileScreen());
                          },
                          child: const Text(
                            "Edit picture",
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
                      Icons.manage_accounts_rounded,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      ' Edit Profile ',
                      style: TextStyle(),
                    ),
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  basicinfo(update: false , pphone: '', eemail: '', nname: '',)));
                    },
                  ),

                  ListTile(
                    textColor: iconcolor,
                    iconColor: iconcolor,
                    hoverColor: hovercolor,
                    leading: const Icon(
                      Icons.info_rounded,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Text(
                      ' Personal information ',
                      style: TextStyle(),
                    ),
                    onTap: () {
                      // basicinfo
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => personalinfo()));
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
                      ' About ',
                      style: TextStyle(),
                    ),
                    onTap: () {
                 Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => aboutscreen()));
                    },
                  ),
                  //  menu
                  //  ProfileWidgetMenu(title: "All Users",icon: LineAwesomeIcons.info,onPress: (){
                  //       Get.to(()=>AllUserProfileScreen());},),
                  //   ProfileWidgetMenu(title: "Filling Detail",icon: LineAwesomeIcons.outdent,onPress: (){
                  //     Get.to(()=>FillingDetail());
                  //   },),
                  //   ProfileWidgetMenu(title: "Chat",icon: LineAwesomeIcons.cog,onPress: (){
                  //     Get.to(()=>ChatScreen());
                  //   },),
                  //   ProfileWidgetMenu(title: "Tasks",icon: LineAwesomeIcons.user_check,onPress: (){},),
                  //   const Divider(color: Colors.grey,),
                  //   const SizedBox(height: 10,),
                  //   ProfileWidgetMenu(title: "Logout",icon: LineAwesomeIcons.alternate_sign_out,
                  //     endIcon:false,
                  //     textColor:Colors.red,
                  //       onPress: (){
                  //         AuthenticationRepository.instance.logout();
                  //       },),
                ]))));
  }
}
