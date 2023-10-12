import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeProfile extends StatelessWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("PROFILE PAGE TO BE IMPLEMENTED!"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (r) => false);
              },
              child: Text("Log Out"),
            ),
          ],
        ),
      ),
    );
  }
}
