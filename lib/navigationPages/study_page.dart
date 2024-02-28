import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/course_container.dart';
import 'package:study_buddy/components/subject_container.dart';

class StudyPage extends StatelessWidget {
  StudyPage({super.key});

  final List _post = [
    'pos 1',
    'pos 2',
    'pos 3',
    'pos 4',
    'pos 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.inversePrimary,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Find study groups and tutors",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "In your courses",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return CourseContainer();
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Subjects",
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return SubjectContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
