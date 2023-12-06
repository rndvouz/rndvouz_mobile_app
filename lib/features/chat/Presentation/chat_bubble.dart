import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String align;
  const ChatBubble({super.key, required this.message, required this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: align == "sender"? Colors.blue :Colors.grey.shade200,
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
