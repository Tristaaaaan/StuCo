import 'package:flutter/material.dart';
import 'package:study_buddy/components/category_container.dart';
import 'package:study_buddy/pages/create_study_group.dart';
import 'package:study_buddy/pages/find_courses.dart';
import 'package:study_buddy/pages/find_tutors.dart';
import 'package:study_buddy/pages/study_group_page.dart';
import 'package:study_buddy/services/group/search.dart';

class FindPage extends StatelessWidget {
  FindPage({super.key});

  final Map<String, Widget> _pageMap = {
    'Study Groups': const FindStudyGroup(),
    'Tutors': const FindTutors(),
    'Create Study Group': CreateStudyGroup(),
    'Courses': const FindCourses(),
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
      appBar: AppBar(
        title: const Text("Find tutors or study groups"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearch(),
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: Expanded(
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
    );
  }
}
