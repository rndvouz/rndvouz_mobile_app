import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/presentation/error_page.dart';
import 'package:rndvouz/features/common/presentation/loading.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_collection.dart';
import 'package:rndvouz/features/swipe/presentation/new_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../merchandise/domain/merchandise.dart';

class SwipeFeature extends ConsumerStatefulWidget {
  // required this User logged in

  const SwipeFeature({Key? key}) : super(key: key);

  @override
  ConsumerState<SwipeFeature> createState() => _SwipeFeature();
}

class _SwipeFeature extends ConsumerState<SwipeFeature> {
  final CardSwiperController controller = CardSwiperController();

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
        return const Center(
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
    final AsyncValue<List<Merchandise>> asyncMerchData =
        ref.watch(merchandiseProvider);

    return asyncMerchData.when(
        data: (merchData) => _build(
              context: context,
              merch: merchData,
            ),
        loading: () => const Loading(),
        error: (error, st) => ErrorPage(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context, required List<Merchandise> merch}) {
    MerchandiseCollection merchandiseCollection = MerchandiseCollection(merch);

    final List<Merchandise> swipeMerchandises =
        merchandiseCollection.loadMerchanise(Purpose.browse);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
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
                  const SizedBox(
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
