import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/common/presentation/error_page.dart';
import 'package:rndvouz/features/common/presentation/loading.dart';
import 'package:rndvouz/features/merchandise/data/merchandise_providers.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise_collection.dart';

import '../../merchandise/data/merchandise_db.dart';
import '../../merchandise/domain/merchandise_garment.dart';
import 'home_browse_item_preview.dart';

class HomeSearch extends ConsumerStatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends ConsumerState<HomeSearch> {
  TextEditingController searchController = TextEditingController();
  List<Merchandise> filteredSearch = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 3.0, left: 10.0, right: 10.0, bottom: 10.0),
            child: Center(
              child: TextField(
                onChanged: onSearchText,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search for an item",
                  hintStyle: const TextStyle(color: Colors.black54),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(35.0),
                  //   borderSide: const BorderSide(
                  //     color: Colors.black,
                  //     width: 0.5,
                  //   ),
                  // ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
          ),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          // If searched text is empty AND the textField is not empty
          child: filteredSearch.isEmpty && searchController.text.isNotEmpty
              // Display that no items were found for the search
              ? Center(
                  child: Text("No items found for '${searchController.text}'"),
                )
              // Else, when the textField is empty
              : searchController.text.isEmpty
                  // Display the garment grid of options to choose from
                  ? GarmentGrid()
                  // When there is a search result that matches, display it in a grid format
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      children: filteredSearch.map((merch) {
                        return searchCard(context, merch);
                      }).toList(),
                    ),
        ),
      ),
    );
  }

  void onSearchText(String text) {
    setState(() {
      // final merchandiseDB = ref.watch(merchandiseDBProvider);
      // filteredSearch = merchandiseDB
      //     .where((merch) =>
      //         (merch.merchName.toLowerCase().contains(text.toLowerCase()) ||
      //             merch.garment
      //                 .toString()
      //                 .toLowerCase()
      //                 .contains(text.toLowerCase())) &&
      //         merch.purpose != Purpose.setup)
      //     .toList();
    });
  }
}

class GarmentGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: Garment.values.length,
      itemBuilder: (BuildContext context, int index) {
        final garmentName =
            Garment.values[index].toString().split('.')[1].capitalize();
        return ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      GarmentResults(garment: Garment.values[index]),
                ));
          },
          child: Text(garmentName),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class GarmentResults extends ConsumerWidget {
  final Garment garment;

  GarmentResults({required this.garment});

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

  @override
  Widget _build(
      {required BuildContext context, required List<Merchandise> merch}) {
    List<Card> _buildGridGarmentCards(BuildContext context) {
      MerchandiseCollection merchandiseCollection =
          MerchandiseCollection(merch);

      List<Merchandise> merchandiseGarment =
          merchandiseCollection.loadMerchanise(Purpose.browse, garment);

      if (merchandiseGarment.isEmpty) {
        return [
          Card(
            elevation: 0.0,
            margin: EdgeInsets.all(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(":()"),
                ],
              ),
            ),
          ),
        ];
      }

      return merchandiseGarment.map((merch) {
        return searchCard(context, merch);
      }).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${garment.toString().split('.')[1].capitalize()}'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  children: _buildGridGarmentCards(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Card searchCard(BuildContext context, Merchandise merch) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.all(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: AspectRatio(
              aspectRatio: 12 / 8,
              child: Image.asset(
                "${merch.assetImages}.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  merch.merchName,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
