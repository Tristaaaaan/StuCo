import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/study_group_container.dart';
import 'package:study_buddy/pages/chat_page.dart';

class FindStudyGroup extends StatefulWidget {
  const FindStudyGroup({super.key});

  @override
  State<FindStudyGroup> createState() => _FindStudyGroupState();
}

class _FindStudyGroupState extends State<FindStudyGroup> {
  // List Document IDs
  late List<Map<String, dynamic>> studyGroupList = [];

  late String groupChatId;

  late Future<void> _future;

  @override
  void initState() {
    super.initState();
    _future = getDocId();
  }

  // get Data from database
  Future<void> getDocId() async {
    List<Map<String, dynamic>> tempList = [];
    await FirebaseFirestore.instance
        .collection('study_groups')
        .orderBy('createdAt', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            tempList.add({
              'id': document.id,
              'data': document.data(),
            });
          }),
        );

    setState(() {
      studyGroupList = tempList;
    });
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
          FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: studyGroupList.length,
                    itemBuilder: (context, index) {
                      String docId = studyGroupList[index]['id'];
                      Map<String, dynamic> docData =
                          studyGroupList[index]['data'];
                      return StudyGroupContainer(
                        title: docData["studyGrppTitle"] ?? "No Title",
                        desc:
                            docData["studyGrpDescription"] ?? "No Description",
                        members: (docData["members"]?.length ?? 0).toString(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                    groupChatId: docId,
                                    chatName: docData["studyGrppTitle"])),
                          );
                        },
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
