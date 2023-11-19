import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rndvouz/features/chat/Presentation/chat.dart';

class HomeNotification extends StatefulWidget {
  @override
  _HomeNotificationState createState() => _HomeNotificationState();
}

class _HomeNotificationState extends State<HomeNotification> {
  late StreamController<ChatMessage> _streamController;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<ChatMessage>();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Message",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: StreamBuilder<ChatMessage>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildChatList(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final message = ChatMessage(
            text: 'New Message',
            timestamp: DateTime.now(),
            isMe: true,
          );
          _streamController.sink.add(message);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: 60.0,
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget buildChatList(ChatMessage message) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _onMessageClicked(message);
          },
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(message.text),
            subtitle: Text(
              DateFormat('HH:mm').format(message.timestamp),
              style: const TextStyle(fontSize: 12.0),
            ),
            trailing: message.isMe ? null : const Icon(Icons.person),
            tileColor: message.isMe ? Colors.blue.withOpacity(0.2) : null,
          ),
        );
      },
    );
  }

  void _onMessageClicked(ChatMessage message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SingleChat(),
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final DateTime timestamp;
  final bool isMe;

  ChatMessage({
    required this.text,
    required this.timestamp,
    required this.isMe,
  });
}
