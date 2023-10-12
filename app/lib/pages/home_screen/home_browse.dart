import 'package:app/data_models/merchandise.dart';
import 'package:app/data_models/merchandise_db.dart';
import 'package:flutter/material.dart';

import '../../data_models/merchandise_garment.dart';

// Change to Stateful when you can tap on image to view more information about it
class HomeBrowse extends StatelessWidget {
  const HomeBrowse({Key? key}) : super(key: key);

  List<Card> _buildGridMerchCards(BuildContext context) {
    List<Merchandise> allMerchandise =
        MerchandiseDB.loadMerchanise(Garment.all);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: _buildGridMerchCards(context),
      ),
    );
  }
}
