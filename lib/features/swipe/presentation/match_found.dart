import 'package:flutter/material.dart';
import 'package:rndvouz/features/home/presentation/home_browse.dart';

import '../../common/data/colors.dart';
import '../../merchandise/domain/merchandise.dart';
import '../../user/domain/user.dart';
import 'new_swipe_card.dart';

class MatchFound extends StatefulWidget {
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
  State<MatchFound> createState() => _MatchFoundState();
}

class _MatchFoundState extends State<MatchFound> with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<Offset> _offsetBottomLeft = Tween<Offset>(
    begin: const Offset(-2.0, 0.0),
    end: Offset.zero,
  ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

  late final Animation<Offset> _offsetTopRight = Tween<Offset>(
    begin: const Offset(2.0, 0.0),
    end: Offset.zero,
  ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    final merchUserImg = Image.asset(
      "${widget.merchUser.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );
    final merchMatchImg = Image.asset(
      "${widget.merchMatched.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Top Left: "Match found" text
            Positioned(
              top: 50,
              left: 30,
              child: Container(
                width: 500,
                height: 500,
                child: Stack(
                  children: [
                    // Bottom Words
                    Positioned(
                      top: 15,
                      left: 7,
                      child: Transform.rotate(
                        angle: -0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Match",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 75,
                                fontWeight: FontWeight.bold,
                                color: secondaryBrown.withOpacity(0.5),
                                height: 0.8,
                              ),
                            ),
                            Text(
                              " Found!",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 73,
                                fontWeight: FontWeight.bold,
                                color: secondaryBrown.withOpacity(0.5),
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Middle Words
                    Positioned(
                      top: 13,
                      left: 4,
                      child: Transform.rotate(
                        angle: -0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Match",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 75,
                                fontWeight: FontWeight.bold,
                                color: secondaryBrown,
                                height: 0.8,
                              ),
                            ),
                            Text(
                              " Found!",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 73,
                                fontWeight: FontWeight.bold,
                                color: secondaryBrown,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Top Words
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Transform.rotate(
                        angle: -0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Match",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 75,
                                fontWeight: FontWeight.bold,
                                color: colorCream2,
                                height: 0.8,
                              ),
                            ),
                            Text(
                              " Found!",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 73,
                                fontWeight: FontWeight.bold,
                                color: colorCream2,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Left: Current User
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: 220, left: 20),
                child: SlideTransition(
                  position: _offsetBottomLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "You",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      NewSwipeCard(
                        merchandise: widget.merchMatched,
                        cardStyle: "match",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Top Right: Other User
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 160, right: 20),
                child: SlideTransition(
                  position: _offsetTopRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.currentUser.username,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      NewSwipeCard(
                        merchandise: widget.merchUser,
                        cardStyle: "match",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Right: "Keep Swiping" button
            Positioned(
              bottom: 0,
              right: 90,
              child: Container(
                height: 350,
                padding: EdgeInsets.only(
                  left: 30,
                  top: 110,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Message"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 260,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(colorGreen2),
                        ),
                        child: Text("Keep Swiping"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
