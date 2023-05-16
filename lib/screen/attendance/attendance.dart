import 'package:flutter/material.dart';

class attendance extends StatefulWidget {
  const attendance({super.key});

  @override
  State<attendance> createState() => _attendanceState();
}

class _attendanceState extends State<attendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("attendance"),
      ),
    );
  }
}