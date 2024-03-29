import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/firebase_options.dart';
import 'package:study_buddy/services/auth/auth_gate.dart';
import 'package:study_buddy/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthGate(), //AuthGate
      theme: lightMode,
    );
  }
}
