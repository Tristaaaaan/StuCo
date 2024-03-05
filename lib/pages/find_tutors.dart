import 'package:flutter/material.dart';

class FindTutors extends StatelessWidget {
  const FindTutors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tutors"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Find Tutors",
          ),
        ));
  }
}
