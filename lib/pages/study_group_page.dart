import 'package:flutter/material.dart';
import 'package:study_buddy/components/study_group_container.dart';

class FindStudyGroup extends StatelessWidget {
  const FindStudyGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    CircleAvatar(),
                    Icon(Icons.search),
                  ],
                ),
                Text(
                  "Study Groups",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return StudyGroupContainer(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindStudyGroup()),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
