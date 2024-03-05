import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/course_container.dart';
import 'package:study_buddy/components/subject_container.dart';
import 'package:study_buddy/pages/chat_page.dart';
import 'package:study_buddy/services/group/search.dart';
import 'package:study_buddy/services/group/user_chats.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final UserChats _userChats = UserChats();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late final Stream<QuerySnapshot<Object?>> _groupChats = getUserGroupChatsId(
    _firebaseAuth.currentUser!.uid,
  );

  Stream<QuerySnapshot<Object?>> getUserGroupChatsId(String groupChatId) {
    return _userChats.getUserGroupChatsId(groupChatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "Find study groups and tutors",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearch(),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Search",
                            ),
                          ),
                          Icon(
                            Icons.search,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
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
          SizedBox(
            height: 250,
            child: StreamBuilder(
              stream: _groupChats,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: Expanded(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      return CourseContainer(
                        titleText: data["groupChatTitle"],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(
                                chatName: data["groupChatTitle"],
                                groupChatId: data["groupChatId"],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
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
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const SubjectContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
