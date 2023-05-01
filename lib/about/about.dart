import 'package:flutter/material.dart';

class aboutscreen extends StatefulWidget {
  const aboutscreen({super.key});

  @override
  State<aboutscreen> createState() => _aboutscreenState();
}

class _aboutscreenState extends State<aboutscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: const Color(0xFF17203A),
        title: const Text('About'),
      ),
      body: Center(
        child: Text("about page"),
      ),
    );
  }
}