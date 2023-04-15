import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanagement/constant/colors.dart';

// class forgotpasswordbuttonwidget extends StatelessWidget {
//   const forgotpasswordbuttonwidget({
//     super.key,
//     required this.btnIcon,
//     required this.title,
//     required this.subTitle,
//     required this.onTap,
//   });
//   final IconData btnIcon;
//   final String title,subTitle;
//   final VoidCallback onTap;
class Description extends StatelessWidget {
  const Description({
    super.key,
    this.title,
    this.description,
  });
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
        backgroundColor: tSecondaryColor,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                title!,
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                description!,
                style: GoogleFonts.roboto(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
