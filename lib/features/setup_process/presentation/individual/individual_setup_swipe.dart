// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';

// Database Packages
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/features/user/domain/user.dart';

// Components
import 'package:rndvouz/features/swipe/presentation/new_swipe_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// Pages
import '../setup_style.dart';
import '../setup_top_bar.dart';

class IndividualSetupSwipe extends ConsumerStatefulWidget {
  static const String routeName = '/setupSwipe';
  const IndividualSetupSwipe({super.key});

  @override
  ConsumerState<IndividualSetupSwipe> createState() =>
      _IndividualSetupSwipeState();
}

class _IndividualSetupSwipeState extends ConsumerState<IndividualSetupSwipe> {
  final CardSwiperController controller = CardSwiperController();

  // final List<Merchandise> merchandises =
  //     merchandiseDB.loadMerchanise(Purpose.setup);

  int displayedIndex = 0;

  _onSwipe({required int length}) async {
    setState(() {
      displayedIndex = (displayedIndex + 1) % length;
    });

    // debugPrint(
    //   'Card at $previousIndex was swiped to direction ${direction.name}. Card on currently displayed is $currentIndex',
    // );

    return true;
  }

  void endSwipe(UserDB userDB, User? newUser) async {
    final updateUser = newUser!.copyWith(setupStep: "setupStyle");
    await userDB.updateUser(updateUser);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SetupStyle()));
  }

  @override
  Widget build(BuildContext context) {
    final newUser = ref.watch(currentUserProvider);

    return newUser.when(
        data: (user) {
          return _build(context, ref, user);
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stacktrace) => const Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _build(BuildContext context, WidgetRef ref, User newUser) {
    final userDB = ref.watch(userDBProvider);
    final merchDB = ref.watch(merchandiseDBProvider);

    final List<Merchandise> merchandises =
        merchDB.loadMerchanise(Purpose.setup) as List<Merchandise>;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SetupTopBar(state: 'swipe'),
            const SizedBox(
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
                onSwipe: _onSwipe(length: merchandises.length),
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(30, 10),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                        verticalOffsetPercentage) =>
                    NewSwipeCard(
                  merchandise: merchandises[index],
                  setup: true,
                ),
                onEnd: () => endSwipe(userDB, newUser),
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
