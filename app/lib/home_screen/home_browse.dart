import 'package:app/data_model/merchandise.dart';
import 'package:app/data_model/merchandise_db.dart';
import 'package:app/swipe_feature.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../data_model/merchandise_garment.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeBrowseOrSwipe extends StatelessWidget {
  const HomeBrowseOrSwipe({Key? key}) : super(key: key);

  static const List<String> titles = <String>['Browse', 'Swipe'];

  // Items for Browsing Feature
  List<Card> _buildGridMerchCards(BuildContext context) {
    List<Merchandise> allMerchandise =
        MerchandiseDB.loadMerchanise(Purpose.browse);

    if (allMerchandise.isEmpty) {
      // Maybe provide an error message here
      return const <Card>[];
    }

    return allMerchandise.map((merch) {
      return Card(
        elevation: 0.0,
        margin: EdgeInsets.all(0.5),
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
      );
    }).toList();
  }

  // Items for Swiping Feature

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 2;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorGreen1,
          toolbarHeight: 1,
          bottom: TabBar(
            indicatorColor: colorBrown1,
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.apps),
                text: titles[0],
              ),
              Tab(
                icon: const Icon(Icons.swipe),
                text: titles[1],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            GridView.count(
              crossAxisCount: 3,
              children: _buildGridMerchCards(context),
            ),
            const SwipeFeature(),
          ],
        ),
      ),
    );
  }
}
