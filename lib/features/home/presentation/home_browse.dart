import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/presentation/error_page.dart';
import 'package:rndvouz/features/common/presentation/loading.dart';
import 'package:rndvouz/features/home/presentation/home_browse_item_preview.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/add_merch.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_collection.dart';

import 'package:rndvouz/features/swipe/presentation/swipe_feature.dart';
import 'package:flutter/material.dart';

import '../../common/data/colors.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeBrowseOrSwipe extends ConsumerWidget {
  const HomeBrowseOrSwipe({super.key});

  static const List<String> titles = <String>['Browse', 'Swipe'];

  // Items for Browsing Feature
  List<Card> _buildGridMerchCards(
      BuildContext context, MerchandiseCollection merchandiseCollection) {
    List<Merchandise> allMerchandise =
        merchandiseCollection.loadMerchanise(Purpose.browse);

    if (allMerchandise.isEmpty) {
      // Maybe provide an error message here
      return const <Card>[];
    }

    return allMerchandise.map((merch) {
      return Card(
        elevation: 0.0,
        margin: const EdgeInsets.all(0.5),
        child: InkWell(
          onTap: () {
            // Navigate to the detail page when a merchandise item is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeBrowseItemPreview(merchandise: merch),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1 / 1,
                child: (merch.id.length < 3)
                    ? Image.asset(
                        "${merch.assetImages}.jpg",
                        fit: BoxFit.fitWidth,
                      )
                    : Image.memory(base64Decode(merch.imagePath!)),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  // Items for Swiping Feature

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    const int tabsCount = 2;

    MerchandiseCollection merchandiseCollection = MerchandiseCollection(merch);

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
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            GridView.count(
              crossAxisCount: 3,
              children: _buildGridMerchCards(context, merchandiseCollection),
            ),
            const SwipeFeature(),
          ],
        ),
      ),
    );
  }
}
