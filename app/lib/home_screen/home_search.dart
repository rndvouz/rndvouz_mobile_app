import 'package:app/model/garment.dart';
import 'package:app/model/merchandise.dart';
import 'package:app/model/merchandise_repository.dart';
import 'package:flutter/material.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeSearch extends StatelessWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("SEARCH PAGE TO BE IMPLEMENTED!"),
          ],
        ),
      ),
    );
  }
}
