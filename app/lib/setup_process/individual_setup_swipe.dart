import 'package:app/data_model/user_db.dart';
import 'package:app/model/garment.dart';
import 'package:app/model/merchandise_repository.dart';
import 'package:flutter/material.dart';

import '../../model/merchandise.dart';
import 'package:app/swipe_card.dart';

import 'setup_style.dart';
import 'setup_top_bar.dart';

class IndividualSetupSwipe extends StatefulWidget {
  final User newUser;

  const IndividualSetupSwipe({Key? key, required this.newUser})
      : super(key: key);

  @override
  _IndividualSetupSwipeState createState() => _IndividualSetupSwipeState();
}

class _IndividualSetupSwipeState extends State<IndividualSetupSwipe> {
  final List<Merchandise> merchandises =
      MerchandiseRepository.loadMerchanise(Garment.signup);

  int currentIndex = 0;

  void nextSwipeCard() {
    setState(() {
      currentIndex = (currentIndex + 1) % merchandises.length;

      if (currentIndex == (merchandises.length - 1)) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SetupStyle(newUser: widget.newUser)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SetupTopBar(state: 'swipe'),
          SwipeCard(merchandise: merchandises[currentIndex]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Red Button
              ElevatedButton(
                  onPressed: nextSwipeCard,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text("X",
                      style: TextStyle(
                        color: Colors.white,
                      ))),
              const SizedBox(
                width: 100.0,
              ),
              // Green Button
              ElevatedButton(
                  onPressed: nextSwipeCard,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: const Text("Y",
                      style: TextStyle(
                        color: Colors.white,
                      ))),
            ],
          )
        ],
      ),
    ));
  }
}
