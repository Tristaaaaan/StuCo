import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/models/group_chat.dart';

class GroupService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a Group Chat
  Future<void> sendGroupChatInfo(
    String studyGrpTitle,
    String studyGrpDesc,
  ) async {
    // get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String curreUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    // create a new Group Chat
    GroupChat newGroupChat = GroupChat(
      creatorId: currentUserId,
      creatorName: curreUserEmail,
      studyGroupTitle: studyGrpTitle,
      studyGroupDescription: studyGrpDesc,
      timestamp: timestamp,
      members: [curreUserEmail],
    );
    // construct a Group Chat ID

    // add new data to database
    await _firestore.collection('study_groups').add(newGroupChat.toMap());
  }
}
