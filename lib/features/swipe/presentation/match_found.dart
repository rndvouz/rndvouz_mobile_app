import 'package:flutter/material.dart';
import 'package:rndvouz/features/home/presentation/home_browse.dart';

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

class _MatchFoundState extends State<MatchFound>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late final AnimationController _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    late final Animation<Offset> _offsetBottomLeft = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticIn));

    late final Animation<Offset> _offsetTopRight = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticIn));

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
            // Top Left: "Match found!" text
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Match found!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Top Right: Add additional widgets for top-right image information
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
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
                      setup: false,
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Left: Bottom left img
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.ownerUser.username,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    NewSwipeCard(
                      merchandise: widget.merchMatched,
                      setup: false,
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Right: "Keep Swiping" button
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Keep Swiping"),
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
