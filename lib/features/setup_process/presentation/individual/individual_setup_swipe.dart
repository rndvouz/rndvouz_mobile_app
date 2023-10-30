// Flutter Packages
import 'package:flutter/material.dart';

// Database Packages
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_db.dart';
import 'package:rndvouz/features/user/domain/user_db.dart';

// Components
import 'package:rndvouz/features/swipe/presentation/new_swipe_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// Pages
import '../setup_style.dart';
import '../setup_top_bar.dart';

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
      MerchandiseDB.loadMerchanise(Purpose.setup);

  int displayedIndex = 0;

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
            SizedBox(
              height: 40.0,
            ),
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: merchandises.length,
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
                  merchandise: merchandises[index],
                  setup: true,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$displayedIndex of ${merchandises.length}"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
