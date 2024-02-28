import 'package:flutter/material.dart';
import 'package:study_buddy/pages/home_page.dart';
import 'package:study_buddy/themes/light_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: lightMode,
    );
  }
}
