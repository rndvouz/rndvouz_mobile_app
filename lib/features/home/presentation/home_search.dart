import 'package:flutter/material.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import '../../merchandise/domain/merchandise_db.dart';
import '../../merchandise/domain/merchandise_garment.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
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
                  hintStyle: TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 0.5,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: filteredSearch.isEmpty && searchController.text.isNotEmpty
              ? Center(
                  child: Text("No items found for '${searchController.text}'"),
                )
              : searchController.text.isEmpty
                  ? GarmentGrid()
                  : GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      children: filteredSearch.map((merch) {
                        return searchCard(merch);
                      }).toList(),
                    ),
        ),
      ),
    );
  }

  void onSearchText(String text) {
    setState(() {
      filteredSearch = merchandiseDB.allGarments
          .where((merch) =>
              (merch.merchName.toLowerCase().contains(text.toLowerCase()) ||
                  merch.garment
                      .toString()
                      .toLowerCase()
                      .contains(text.toLowerCase())) &&
              merch.purpose != Purpose.setup)
          .toList();
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

class GarmentResults extends StatelessWidget {
  final Garment garment;

  GarmentResults({required this.garment});

  @override
  Widget build(BuildContext context) {
    List<Card> _buildGridGarmentCards(BuildContext context) {
      List<Merchandise> merchandiseGarment =
          merchandiseDB.loadMerchanise(Purpose.browse, garment);

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
        return searchCard(merch);
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

Card searchCard(Merchandise merch) {
  return Card(
    elevation: 0.0,
    margin: EdgeInsets.all(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
    ),
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
  );
}
