// Flutter Packages
import 'package:flutter/material.dart';

// Database Packages
import 'package:app/data_model/merchandise_garment.dart';
import 'package:app/data_model/merchandise.dart';
import 'package:app/data_model/merchandise_db.dart';
import 'package:app/data_model/user_db.dart';

// Components
import 'package:app/new_swipe_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// Pages
import 'setup_style.dart';
import 'setup_top_bar.dart';

class IndividualSetupSwipe extends StatefulWidget {
  final User newUser;

  const IndividualSetupSwipe({Key? key, required this.newUser})
      : super(key: key);

  @override
  State<IndividualSetupSwipe> createState() => _IndividualSetupSwipeState();
}

class _IndividualSetupSwipeState extends State<IndividualSetupSwipe> {
  final CardSwiperController controller = CardSwiperController();
  final List<Merchandise> merchandises =
      MerchandiseDB.loadMerchanise(Garment.signup);

  int displayedIndex = 0;

  // void nextSwipeCard() {
  //   setState(() {
  //     currentIndex = (currentIndex + 1) % merchandises.length;

  //     if (currentIndex == (merchandises.length - 1)) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => SetupStyle(newUser: widget.newUser)));
  //     }
  //   });
  // }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      displayedIndex = (displayedIndex + 1) % merchandises.length;
    });

    debugPrint(
      'Card at $previousIndex was swiped to direction ${direction.name}. Card on currently displayed is $currentIndex',
    );

    return true;
  }

  void endSwipe() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SetupStyle(newUser: widget.newUser)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SetupTopBar(state: 'swipe'),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: merchandises.length,
                initialIndex: 0,
                maxAngle: 180,
                allowedSwipeDirection:
                    AllowedSwipeDirection.only(left: true, right: true),
                onSwipe: _onSwipe,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(25, 25),
                // padding: const EdgeInsets.all(10.0),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) =>
                    NewSwipeCard(merchandise: merchandises[index]),
                onEnd: endSwipe,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(24.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       FloatingActionButton(
            //         onPressed: controller.swipeLeft,
            //         child: const Icon(Icons.close),
            //       ),
            //       const SizedBox(
            //         width: 100.0,
            //       ),
            //       FloatingActionButton(
            //         onPressed: controller.swipeRight,
            //         child: const Icon(Icons.favorite),
            //       ),
            //     ],
            //   ),
            // ),
            Text("$displayedIndex of ${merchandises.length}"),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //       body: Center(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         SetupTopBar(state: 'swipe'),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
  //           child: NewSwipeCard(merchandise: merchandises[currentIndex]),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // Red Button
  //             ElevatedButton(
  //                 onPressed: nextSwipeCard,
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all(Colors.red),
  //                 ),
  //                 child: const Text("X",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ))),
  //             const SizedBox(
  //               width: 100.0,
  //             ),
  //             // Green Button
  //             ElevatedButton(
  //                 onPressed: nextSwipeCard,
  //                 style: ButtonStyle(
  //                   backgroundColor: MaterialStateProperty.all(Colors.green),
  //                 ),
  //                 child: const Text("Y",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                     ))),
  //           ],
  //         )
  //       ],
  //     ),
  //   ));
  // }
}
