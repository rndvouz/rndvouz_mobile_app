import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        title: Text('Notification'),
      ),
      body: _buildUserList(),
    );
  }

  // build a list of users list except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("users").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text('error');
        if (snapshot.connectionState == ConnectionState.waiting)
          return Text("loading...");

        // Check if snapshot.data is not null
        if (snapshot.data != null) {
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                    vertical: 5,
                  ),
                  child: _buildUserListItem(doc),
                ))
                .toList(),
          );
        } else {
          // Handle the case when snapshot.data is null
          return Text("No data available");
        }
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
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 35,
            child: Icon(Icons.person),
          ),
        ),
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
