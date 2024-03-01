import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/study_group_container.dart';

class FindStudyGroup extends StatefulWidget {
  const FindStudyGroup({super.key});

  @override
  State<FindStudyGroup> createState() => _FindStudyGroupState();
}

class _FindStudyGroupState extends State<FindStudyGroup> {
  // List Document IDs
  List<String> docIDs = [];

  // get Document IDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('study_groups').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            docIDs.add(document.reference.id);
          }),
        );
  }

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
              child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docIDs.length,
                itemBuilder: (context, index) {
                  return StudyGroupContainer(
                    title:
                        "GA", // DataForGroupContainers(documentID: docIDs[index],),
                    desc: "GA",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FindStudyGroup()),
                      );
                    },
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
