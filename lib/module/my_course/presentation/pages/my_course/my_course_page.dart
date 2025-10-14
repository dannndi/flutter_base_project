
import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyCourseUI();
  }
}

class MyCourseUI extends StatefulWidget {
  const MyCourseUI({super.key});

  @override
  State<MyCourseUI> createState() => _MyCourseUIState();
}

class _MyCourseUIState extends State<MyCourseUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("MyCourse Page")));
  }
}
