import 'package:rndvouz/features/merchandise/domain/merchandise_db.dart';
import 'package:rndvouz/features/user/domain/user_db.dart';
import 'package:rndvouz/features/swipe/presentation/new_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../merchandise/domain/merchandise.dart';

class SwipeFeature extends StatefulWidget {
  // required this User logged in

  const SwipeFeature({Key? key}) : super(key: key);

  @override
  State<SwipeFeature> createState() => _SwipeFeature();
}

class _SwipeFeature extends State<SwipeFeature> {
  final CardSwiperController controller = CardSwiperController();
  final List<Merchandise> swipeMerchandises =
      MerchandiseDB.loadMerchanise(Purpose.browse);

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {});

    debugPrint(
      'Card at $previousIndex was swiped to direction ${direction.name}. Card on currently displayed is $currentIndex',
    );

    return true;
  }

  void endSwipe() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Text(
            "That's all of the available clothes for now. Come back later!",
            style: TextStyle(fontSize: 10.0),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: swipeMerchandises.length,
                initialIndex: 0,
                isLoop: false,
                maxAngle: 70,
                allowedSwipeDirection:
                    AllowedSwipeDirection.only(left: true, right: true),
                onSwipe: _onSwipe,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(30, 10),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) =>
                    NewSwipeCard(
                  merchandise: swipeMerchandises[index],
                  setup: false,
                ),
                onEnd: endSwipe,
              ),
            ),
            Padding(
              // padding: const EdgeInsets.all(50.0),
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: "Xbtn",
                        onPressed: controller.swipeLeft,
                        child: const Icon(Icons.close),
                      ),
                      const SizedBox(
                        width: 130.0,
                      ),
                      FloatingActionButton(
                        heroTag: "Heart",
                        onPressed: controller.swipeRight,
                        child: const Icon(Icons.favorite),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
