import 'package:flutter/material.dart';

class FindCourses extends StatelessWidget {
  const FindCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Find Courses",
        ),
      ),
    );
  }
}
