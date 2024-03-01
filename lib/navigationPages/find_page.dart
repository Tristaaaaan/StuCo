import 'package:flutter/material.dart';
import 'package:study_buddy/components/category_container.dart';
import 'package:study_buddy/components/search_bar.dart';
import 'package:study_buddy/pages/create_study_group.dart';
import 'package:study_buddy/pages/study_group_page.dart';

class FindPage extends StatelessWidget {
  FindPage({super.key});

  final Map<String, Widget> _pageMap = {
    'Study Groups': const FindStudyGroup(),
    'Tutors': const FindStudyGroup(),
    'Create Study Group': CreateStudyGroup(),
    'Courses': CreateStudyGroup(),
  };

  final List _post = [
    'Study Groups',
    'Tutors',
    'Create Study Group',
    'Courses',
  ];

  final List<IconData> icons = [
    Icons.book,
    Icons.account_box,
    Icons.publish,
    Icons.class_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 135,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Search(),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: _post.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Category(
                  text: _post[index],
                  icons: icons[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _pageMap[_post[index]]!,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
