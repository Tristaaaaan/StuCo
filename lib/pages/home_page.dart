import 'package:flutter/material.dart';
import 'package:study_buddy/navigationPages/connect_page.dart';
import 'package:study_buddy/navigationPages/find_page.dart';
import 'package:study_buddy/navigationPages/profile_page.dart';
import 'package:study_buddy/navigationPages/saved_page.dart';
import 'package:study_buddy/navigationPages/study_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    StudyPage(),
    FindPage(),
    ConnectPage(),
    SavedPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Study'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Find'),
          BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Check'),
          BottomNavigationBarItem(icon: Icon(Icons.pin_end), label: 'Saved'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
      ),
    );
  }
}
