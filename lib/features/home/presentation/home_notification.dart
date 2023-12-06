import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rndvouz/features/chat/Presentation/chat.dart';
import 'package:rndvouz/features/chat/domain/chat_service.dart';
import 'package:provider/provider.dart';

class HomeNotification extends StatefulWidget {
  const HomeNotification({super.key});

  @override
  State<HomeNotification> createState() => _HomepageState();
}

class _HomepageState extends State<HomeNotification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _buildUserList(),
    );
  }

  // build a list of users list except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('error');
        if (snapshot.connectionState == ConnectionState.waiting)
          return Text("loading...");
        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  // build individual user List items
  Widget _buildUserListItem(DocumentSnapshot documnet) {
    Map<String, dynamic> data = documnet.data()! as Map<String, dynamic>;

    // dispaly all user except current user
    if (_auth.currentUser!.email! != data['email']) {
      return ListTile(
        title: Text(data['displayName']),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['id'],
              ),
            ),
          );
        },
      );
    }
    return Container();
  }
}
