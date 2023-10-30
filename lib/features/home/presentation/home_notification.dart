import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeNotification extends StatelessWidget {
  const HomeNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("NOTIFICATION PAGE TO BE IMPLEMENTED!"),
          ],
        ),
      ),
    );
  }
}
