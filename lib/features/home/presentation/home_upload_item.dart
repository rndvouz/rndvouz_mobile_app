import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeUploadItem extends StatelessWidget {
  const HomeUploadItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("UPLOAD ITEM PAGE TO BE IMPLEMENTED!"),
          ],
        ),
      ),
    );
  }
}
