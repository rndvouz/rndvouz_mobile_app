import 'package:app/model/garment.dart';
import 'package:app/model/merchandise.dart';
import 'package:app/model/merchandise_repository.dart';
import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeBrowse extends StatelessWidget {
  const HomeBrowse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BROWSE SCROLLING PAGE TO BE IMPLEMENTED!"),
          ],
        ),
      ),
    );
  }
}
