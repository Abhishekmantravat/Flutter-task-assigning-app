import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanagement/main.dart';
import 'package:taskmanagement/model/chat_user.dart';
import 'package:taskmanagement/screen/profile/profiles.dart';

class Chat_user_card extends StatefulWidget {
  final Chatuser user;
  const Chat_user_card({super.key, required this.user});

  @override
  State<Chat_user_card> createState() => _Chat_user_cardState();
}

class _Chat_user_cardState extends State<Chat_user_card> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Card(
        margin: EdgeInsets.symmetric(horizontal: mq.width * .04, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 1,
        child: InkWell(
          onTap: () {},
          child: ListTile(
//  for user profile image 


              // leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
              leading:  ClipRRect(
                borderRadius: BorderRadius.circular(mq.height*.3),
                child: CachedNetworkImage(
                  width:mq.height*.055,
                  height: mq.height*.055,
                  fit: BoxFit.fill,
                      imageUrl:
                        widget.user.image,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const  CircleAvatar(child: Icon(CupertinoIcons.person)),
                   ),
              ),
              
              title: Text(widget.user.name),
              subtitle: Text(

                widget.user.email,
                maxLines: 1,
              ),
              trailing: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.circular(10)),
              )),
        ));
  }
}
