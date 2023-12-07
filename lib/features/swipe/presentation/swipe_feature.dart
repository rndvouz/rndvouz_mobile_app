import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/presentation/error_page.dart';
import 'package:rndvouz/features/common/presentation/loading.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_collection.dart';
import 'package:rndvouz/features/swipe/presentation/new_swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_providers.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../../common/domain/all_data_provider.dart';
import '../../merchandise/domain/merchandise.dart';
import '../../user/data/user_db.dart';
import '../../user/data/user_providers.dart';
import '../../user/domain/user.dart';
import 'match_found.dart';

class SwipeFeature extends ConsumerStatefulWidget {
  // required this User logged in
  const SwipeFeature({Key? key}) : super(key: key);

  @override
  ConsumerState<SwipeFeature> createState() => _SwipeFeature();
}

class _SwipeFeature extends ConsumerState<SwipeFeature>
    with SingleTickerProviderStateMixin {
  final CardSwiperController controller = CardSwiperController();

  _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction,
      {required User user, required Merchandise merchandise}) async {
    debugPrint(
      'Card at $previousIndex was swiped to direction ${direction.name}. Card on currently displayed is $currentIndex',
    );

    final Merchandise currentMerch = merchandise;
    User currentUser = user;

    if (direction.name == 'right') {
      // handleRightSwipe(currentUser, currentMerch);
      final UserDB userDB = ref.read(userDBProvider);

      // create a swiped right item
      final SwipedRightItems swipeRightItem = SwipedRightItems(
        ownerUser: currentMerch.ownerUsername,
        merchId: currentMerch.id,
      );

      // add to current user's SwipedRightItems list
      userDB.updateSwipedRight(user.id, swipeRightItem);

      // Check if the username is in database by using username instead of a user's id
      final User? ownerUser =
          await userDB.fetchUserByUsername(currentMerch.ownerUsername);

      if (ownerUser != null) {
        // merchUser exists, go through their swipedRight List
        // ignore: unnecessary_null_comparison
        if (ownerUser.swipedRight != null) {
          try {
            final SwipedRightItems matchingItem =
                ownerUser.swipedRight.firstWhere(
              (swipedItem) => swipedItem.ownerUser == currentUser.username,
            );

            // Fetch the matching merchandise from owner of currentMerch
            final MerchandiseDB merchDB = ref.read(merchandiseDBProvider);
            final Merchandise matchingMerchandise =
                await merchDB.fetchMerchandise(matchingItem.merchId);

            // Handle "Match Found" view with the matching merchandise
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MatchFound(
                  merchUser:
                      matchingMerchandise, // from current user that owner has in their swipedRight list
                  merchMatched:
                      currentMerch, // from owner that currentUser just swiped right on
                  currentUser: user,
                  ownerUser: ownerUser,
                ),
              ),
            );
          } catch (e) {
            print("merchUser didn't swipe right on any of currentUser's items");
          }
        }
      } else {
        // merchUser does not exist in database
        print(
            'User with username ${currentMerch.ownerUsername} does not exist in UserDB');
      }
    }
  }

  handleRightSwipe(User user, Merchandise currentMerch) async {
    final UserDB userDB = ref.read(userDBProvider);

    // create a swiped right item
    final SwipedRightItems swipeRightItem = SwipedRightItems(
      ownerUser: currentMerch.ownerUsername,
      merchId: currentMerch.id,
    );

    // add to current user's SwipedRightItems list
    userDB.updateSwipedRight(user.id, swipeRightItem);

    // Check if the username is in database by using username instead of a user's id
    final User? ownerUser =
        await userDB.fetchUserByUsername(currentMerch.ownerUsername);

    if (ownerUser != null) {
      // merchUser exists, go through their swipedRight List
      // ignore: unnecessary_null_comparison
      if (ownerUser.swipedRight != null) {
        try {
          final SwipedRightItems matchingItem =
              ownerUser.swipedRight.firstWhere(
            (swipedItem) => swipedItem.ownerUser == user.username,
          );

          // Fetch the matching merchandise from owner of currentMerch
          final MerchandiseDB merchDB = ref.read(merchandiseDBProvider);
          final Merchandise matchingMerchandise =
              await merchDB.fetchMerchandise(matchingItem.merchId);

          // Handle "Match Found" view with the matching merchandise
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MatchFound(
                merchUser:
                    matchingMerchandise, // from current user that owner has in their swipedRight list
                merchMatched:
                    currentMerch, // from owner that currentUser just swiped right on
                currentUser: user,
                ownerUser: ownerUser,
              ),
            ),
          );
        } catch (e) {
          print("merchUser didn't swipe right on any of currentUser's items");
        }
      }
    } else {
      // merchUser does not exist in database
      print(
          'User with username ${currentMerch.ownerUsername} does not exist in UserDB');
    }
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
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);

    return asyncAllData.when(
        data: (allData) {
          return _build(
            context: context,
            userDB: allData.users,
            user: allData.currentUser,
            merch: allData.merchandise,
            ref: ref,
          );
        },
        loading: () => const Loading(),
        error: (error, st) => ErrorPage(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required UserDB userDB,
      required User user,
      required List<Merchandise> merch,
      required WidgetRef ref}) {
    MerchandiseCollection merchandiseCollection = MerchandiseCollection(merch);
    List<Merchandise> swipeMerchandises =
        merchandiseCollection.loadMerchanise(Purpose.browse);

    // List<Merchandise> swipeMerchandises =
    //     merchandiseCollection.loadSwipeMerchandise(user.username);

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
                onSwipe: (prevIndex, currIndex, direction) => _onSwipe(
                    prevIndex, currIndex, direction,
                    user: user, merchandise: swipeMerchandises[prevIndex]),
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
