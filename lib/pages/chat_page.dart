import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/components/chat_bubble.dart';
import 'package:study_buddy/components/rounded_textfield.dart';
import 'package:study_buddy/services/group/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String chatName;
  final String groupChatId;

  const ChatPage({
    super.key,
    required this.chatName,
    required this.groupChatId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      // send message
      await _chatService.sendMessage(
          widget.groupChatId, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.chatName,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _chatService.getMessages(widget.groupChatId),
              builder: (context, snapshot) {
                print("Contents ${widget.groupChatId}");
                print("Contents of getMEssages ${snapshot.data}");
                // errors
                if (snapshot.hasError) {
                  return const Text("Error");
                }
                // loading
                else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return ListView.separated(
                    reverse: true,
                    controller: _scrollController,
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      Map<String, dynamic> data =
                          doc.data() as Map<String, dynamic>;
                      var alignment =
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Alignment.centerRight
                              : Alignment.centerLeft;
                      var backgroundColor =
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Theme.of(context).colorScheme.inversePrimary
                              : Theme.of(context).colorScheme.primary;
                      var textColor =
                          (data['senderId'] == _firebaseAuth.currentUser!.uid)
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.background;
                      return Column(
                        crossAxisAlignment:
                            (data["senderId"] == _firebaseAuth.currentUser!.uid)
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        mainAxisAlignment:
                            (data["senderId"] == _firebaseAuth.currentUser!.uid)
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                        children: [
                          if (data["senderId"] !=
                              _firebaseAuth.currentUser!.uid)
                            Text(data["senderEmail"]),
                          ChatBubble(
                            alignment: alignment,
                            textColor: textColor,
                            backgroundColor: backgroundColor,
                            senderMessage: data["message"],
                          ),
                        ],
                      );
                    },
                  );
                }
                // return list view
              },
            ),
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
                onPressed: () {
                  sendMessage();
                },
                icon: const Icon(Icons.send),
              ),
            ],
          )
        ],
      ),
    );
  }
}
