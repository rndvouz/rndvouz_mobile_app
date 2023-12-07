import 'package:flutter/material.dart';
import 'package:rndvouz/features/home/presentation/home_browse.dart';

import '../../merchandise/domain/merchandise.dart';
import '../../user/domain/user.dart';

class MatchFound extends StatelessWidget {
  const MatchFound(
      {required this.merchUser,
      required this.merchMatched,
      required this.currentUser,
      required this.ownerUser,
      Key? key})
      : super(key: key);

  final Merchandise merchUser;
  final Merchandise merchMatched;
  final User currentUser;
  final User ownerUser;

  @override
  Widget build(BuildContext context) {
    final merchUserImg = Image.asset(
      "${merchUser.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );
    final merchMatchImg = Image.asset(
      "${merchMatched.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );

    return Scaffold(
        body: Stack(
      children: [
        // Bottom Left Img
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: 150,
            height: 150,
            child: merchUserImg,
          ),
        ),
        // Top Right Img
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 150,
            height: 150,
            child: merchMatchImg,
          ),
        ),
        Center(
            child: Text("Match Found!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ))),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeBrowseOrSwipe(),
              ),
            );
          },
          child: Text("Home"),
        ),
      ],
    ));
  }
}
