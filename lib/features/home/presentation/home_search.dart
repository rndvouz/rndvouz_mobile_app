import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("SEARCH PAGE TO BE IMPLEMENTED!"),
          ],
        ),
      ),
    );
  }
}
