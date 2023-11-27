import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './chat_bubble.dart';
import './my_test_field.dart';
import '../domain/chat_service.dart';
import 'package:rndvouz/features/common/data/colors.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatPage({super.key,
    required this.receiverUserEmail,
    required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final ChatService chatService = ChatService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatService.sendMessage(
          widget.receiverUserID, messageController.text);
    }
    //clear the controller
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          //messages
          Expanded(child: _buildMessageList(),),
          //user Input
          _buildMessageInput(),
          SizedBox(height: 10),
        ],

      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: chatService.getMessages(
          widget.receiverUserID, firebaseAuth.currentUser!.uid),
      builder: (cotext, snapshot) {
        if (snapshot.hasError) {
          return Text('Error${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loding...");
        }
        return ListView(
          children: snapshot.data!.docs.map((document) =>
              _buildMessageItem(document)).toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    var sendOrReceiver = (data['senderId'] == firebaseAuth.currentUser!.uid) ? "sender": "receiver";

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: (data['senderId'] ==
              firebaseAuth.currentUser!.uid)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: (data['senderId'] == firebaseAuth.currentUser!.uid)
              ? MainAxisAlignment.end: MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),

            ChatBubble(message: data['message'], align: sendOrReceiver),
          ],
        ),
      ),);
  }

  // build message input
  Widget _buildMessageInput() {
    return Row(
      children: [
        SizedBox(width: 5),
        CircleAvatar(
          backgroundColor: secondaryBrown,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: MyTextField(
            controller: messageController,
            hintText: 'Write message...',
            obscureText: false,
          ),
        ),
        IconButton(
            onPressed: sendMessage,
            icon: Icon(
                Icons.send,
                size: 18,
            )),

      ],
    );

  }
}
