import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/features/user/domain/user_db.dart';
import 'package:rndvouz/features/settings/presentation/settings.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_db.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

final selectedTabProvider = StateProvider<String>((ref) => 'Selling');

class HomeProfile extends ConsumerWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUser = ref.watch(currentUserProvider);
    User user = userDB.getUser(currentUser);

    final selectedTab = ref.watch(selectedTabProvider);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://qph.fs.quoracdn.net/main-qimg-11ef692748351829b4629683eff21100.webp'),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    user.displayName ?? "",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 40,
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        // Add your button click logic here
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Settings()),
                      );
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(user.biography ?? "...."),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      user.follower!.length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Text(
                      'Followers',
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      user.following!.length.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Text(
                      'Following',
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '30',
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Text(
                      'Like',
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Divider(
                thickness: 1,
                color: Colors.blueGrey[200],
              ),
            ),

            // Selling and Sold tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(selectedTabProvider.notifier).state = 'Selling';
                  },
                  child: Text(
                    'Selling',
                    style: TextStyle(
                      color: ref.read(selectedTabProvider.notifier).state == 'Selling' ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(selectedTabProvider.notifier).state = 'Sold';
                  },
                  child: Text(
                    'Sold',
                    style: TextStyle(
                      color: ref.read(selectedTabProvider.notifier).state == 'Sold' ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Conditional content based on the selected tab
            if (ref.read(selectedTabProvider.notifier).state == 'Selling')
              ..._buildSellingItems(currentUser),
            if (ref.read(selectedTabProvider.notifier).state == 'Sold')
              ..._buildSoldItems(currentUser),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSellingItems(String currentUser) {
    List<Merchandise> allMerchandise = merchandiseDB.findByOwnerAndState(currentUser, Availability.selling);
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
          Expanded(
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


  List<Widget> _buildSoldItems(String currentUser) {
    List<Merchandise> allMerchandise = merchandiseDB.findByOwnerAndState(currentUser, Availability.sold);
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
          Expanded(
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
