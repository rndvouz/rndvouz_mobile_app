import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/data/colors.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/features/user/domain/user.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/settings/presentation/settings.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_db.dart';

final selectedTabProvider = StateProvider<String>((ref) => 'Selling');

class HomeProfile extends ConsumerWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDB userDB = ref.watch(userDBProvider);
    ref.watch(selectedTabProvider);
    final AsyncValue<User> user = ref.watch(currentUserProvider);

    return user.when(
      data: (user) {
        return _build(
          context,
          userDB,
          user,
          ref,
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stacktrace) {
        return const Center(child: Text('Something went wrong'));
      },
    );
  }

  Widget _build(BuildContext context, UserDB userDB, User user, WidgetRef ref) {
    return Container(
      color: colorGreen1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Welcome, ",
                    ),
                    TextSpan(
                      text: user.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: "!",
                    )
                  ],
                ),
              ),
            ),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.height / 15,
                              backgroundImage: (user.imagePath == null)
                                  ? const NetworkImage(
                                      'https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp')
                                  : Image.memory(base64Decode(user.imagePath!))
                                      .image,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              user.follower.length.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Followers',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blueGrey),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              user.following.length.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Following',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blueGrey),
                                            ),
                                          ],
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '30',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              'Like',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blueGrey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: secondaryBrown,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color: secondaryBrown,
                                                width: 1,
                                                style: BorderStyle.solid,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          onPressed: () {
                                            // Add your button click logic here
                                          },
                                          child: const Text(
                                            'Edit Profile',
                                          ),
                                        ),
                                        FittedBox(
                                          child: IconButton(
                                            color: secondaryBrown,
                                            iconSize: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.04,
                                            padding: EdgeInsets.all(0),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const Settings()),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.settings,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            user.displayName != null
                                ? Text(
                                    user.displayName!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                            user.biography != null && user.biography != ""
                                ? Text(
                                    user.biography ?? "",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.016,
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),
                          ],
                        ),
                      ),

                      // // Selling and Sold tabs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              border: ref
                                          .read(selectedTabProvider.notifier)
                                          .state ==
                                      'Selling'
                                  ? const Border(
                                      bottom: BorderSide(
                                          color: tertiaryBlue, width: 2),
                                    )
                                  : null,
                            ),
                            child: TextButton(
                              onPressed: () {
                                ref.read(selectedTabProvider.notifier).state =
                                    'Selling';
                              },
                              child: Text(
                                'Selling',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: ref
                                              .read(
                                                  selectedTabProvider.notifier)
                                              .state ==
                                          'Selling'
                                      ? tertiaryBlue
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              border: ref
                                          .read(selectedTabProvider.notifier)
                                          .state ==
                                      'Sold'
                                  ? const Border(
                                      bottom: BorderSide(
                                          color: tertiaryBlue, width: 2),
                                    )
                                  : null,
                            ),
                            child: TextButton(
                              onPressed: () {
                                ref.read(selectedTabProvider.notifier).state =
                                    'Sold';
                              },
                              child: Text(
                                'Sold',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: ref
                                              .read(
                                                  selectedTabProvider.notifier)
                                              .state ==
                                          'Sold'
                                      ? tertiaryBlue
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                // Conditional content based on the selected tab
                if (ref.read(selectedTabProvider.notifier).state == 'Selling')
                  ..._buildSellingItems(user.username, ref),
                if (ref.read(selectedTabProvider.notifier).state == 'Sold')
                  ..._buildSoldItems(user.username, ref),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSellingItems(String currentUser, WidgetRef ref) {
    final merchandiseDB = ref.watch(merchandiseDBProvider);

    List<Merchandise> allMerchandise = merchandiseDB.findByOwnerAndState(
        currentUser, Availability.selling) as List<Merchandise>;

    List<Widget> sellingItems = [];

    for (int i = 0; i < allMerchandise.length; i += 3) {
      List<Widget> rowItems = [];
      for (int j = i; j < i + 3 && j < allMerchandise.length; j++) {
        final merch = allMerchandise[j];
        rowItems.add(
          Expanded(
            child: Card(
              elevation: 0.0,
              margin: const EdgeInsets.all(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      "${merch.assetImages}.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // If the row has fewer than 3 items, add empty cards to complete the row
      while (rowItems.length < 3) {
        rowItems.add(
          const Expanded(
            child: Card(),
          ),
        );
      }
      sellingItems.add(
        Row(
          children: rowItems,
        ),
      );
    }

    return sellingItems;
  }

  List<Widget> _buildSoldItems(String currentUser, WidgetRef ref) {
    final merchandiseDB = ref.watch(merchandiseDBProvider);

    List<Merchandise> allMerchandise = merchandiseDB.findByOwnerAndState(
        currentUser, Availability.sold) as List<Merchandise>;
    List<Widget> sellingItems = [];

    for (int i = 0; i < allMerchandise.length; i += 3) {
      List<Widget> rowItems = [];
      for (int j = i; j < i + 3 && j < allMerchandise.length; j++) {
        final merch = allMerchandise[j];
        rowItems.add(
          Expanded(
            child: Card(
              elevation: 0.0,
              margin: const EdgeInsets.all(0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      "${merch.assetImages}.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      // If the row has fewer than 3 items, add empty cards to complete the row
      while (rowItems.length < 3) {
        rowItems.add(
          const Expanded(
            child: Card(),
          ),
        );
      }
      sellingItems.add(
        Row(
          children: rowItems,
        ),
      );
    }

    return sellingItems;
  }
}
