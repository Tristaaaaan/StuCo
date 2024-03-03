import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/rounded_textfield.dart';
import 'package:study_buddy/services/auth/auth_service.dart';
import 'package:study_buddy/services/group/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String chatName;
  final String groupChatId;
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ChatPage({
    super.key,
    required this.chatName,
    required this.groupChatId,
  });

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // send message
      await _chatService.sendMessage(groupChatId, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chatName,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),
          Row(
            children: [
              Expanded(
                child: RoundedTextField(
                  hintText: "Enter a message",
                  obscureText: false,
                  controller: _messageController,
                ),
              ),
              IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.send),
              ),
            ],
          )
        ],
      ),
    );
  }

  // build Message list
  Widget _buildMessageList() {
    String senderID = _firebaseAuth.currentUser!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(groupChatId),
      builder: (context, snapshot) {
        print("Contents $groupChatId");
        print("Contents of getMEssages ${snapshot.data}");
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }
        // loading
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        } else {
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        }
        // return list view
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(
      data["message"],
      style: const TextStyle(color: Color.fromRGBO(2, 43, 32, 1)),
    );
  }
}
