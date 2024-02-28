import 'package:flutter/material.dart';
import 'package:study_buddy/auth/login_or_register.dart';
import 'package:study_buddy/themes/light_mode.dart';
import 'package:study_buddy/pages/get_started.dart';
import 'package:study_buddy/pages/login_page.dart';
import 'package:study_buddy/pages/register_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStarted(),
      theme: lightMode,
    );
  }
}
