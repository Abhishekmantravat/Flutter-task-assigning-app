import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanagement/constant/colors.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/model/chat_user.dart';


class all_employee extends StatefulWidget {
  // final Chatuser user;
  const all_employee({
    super.key,
  });

  @override
  State<all_employee> createState() => _all_employeeState();
}

class _all_employeeState extends State<all_employee> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tSecondaryColor,
        title: const Text("All Employees"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final docs = snapshot.data?.docs;

              return ListView.builder(
                                      padding: EdgeInsets.only(top: mq.height * .02),
                  itemCount: docs?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Card(
                     margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
                        child: ListTile(
                            leading: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(mq.height * .3),
                              child: CachedNetworkImage(
                                width: mq.height * .055,
                                height: mq.height * .055,
                                fit: BoxFit.fill,
                                imageUrl: " widget.user.image",
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const CircleAvatar(
                                        child: Icon(CupertinoIcons.person)),
                              ),
                            ),
                            title: Text(docs![index]['name']),
                            subtitle: Text(docs[index]['email']),
                            trailing:    Icon(Icons.verified_rounded),
                      ),
                    ),
                    );
                  });
            }
          }),
    );
  }
}
