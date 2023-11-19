import 'package:flutter/material.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import '../common/data/colors.dart';

class HomeBrowseItemPreview extends StatelessWidget {
  final Merchandise merchandise;

  const HomeBrowseItemPreview({Key? key, required this.merchandise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const OutlinedBorder roundBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50)));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${merchandise.merchName}",
          style: TextStyle(fontSize: 19.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 25.0,
                  left: 25.0,
                  bottom: 25.0), // Adjust the padding values as needed
              child: Text(
                "${merchandise.ownerUsername}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              "${merchandise.assetImages}.jpg",
              fit:
                  BoxFit.cover, // Use BoxFit.cover to maintain the aspect ratio
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            "${formatAvailability(merchandise.state)}",
                          ),
                          shape: roundBorder,
                          backgroundColor: colorGreen2,
                        ),
                        SizedBox(
                            width: 8.0), // Add some spacing between the chips
                        Chip(
                          label: Text(
                              "${formatSellingMethod(merchandise.sellingMethod)}"),
                          shape: roundBorder,
                          backgroundColor: colorGreen2,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("${formatText(merchandise.sellingMethod)}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                            "${formatSellingDisplay(merchandise.sellingMethod)}",
                            style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("Item Description",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            children: [
                              // Add in item description property for item later
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("Item Measurements",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '15" x 4" x 10"',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              child: TextField(
                                maxLines: null, // Allow multiple lines of text
                                decoration: InputDecoration(
                                  hintText: '   Type your comment..',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Set the border radius
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  10.0), // Add some spacing between the input field and button
                          ElevatedButton(
                            onPressed: () {
                              // Handle button click
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(30.0,
                                  30.0), // Set the fixed size of the button
                            ),
                            child: Icon(Icons.send),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatAvailability(Availability state) {
    switch (state) {
      case Availability.selling:
        return 'Available';
      case Availability.sold:
        return 'Sold';
      default:
        return 'Unknown';
    }
  }

  String formatSellingMethod(SellingMethod method) {
    switch (method) {
      case SellingMethod.selling:
        return 'Selling';
      case SellingMethod.trading:
        return 'Trading';
      case SellingMethod.negotiate:
        return 'Negotiate';
      default:
        return 'Unable to get selling method';
    }
  }

  String formatSellingDisplay(SellingMethod method) {
    switch (method) {
      case SellingMethod.selling:
        return '${merchandise.price}';
      case SellingMethod.trading:
        return '${merchandise.desiredTrade}';
      case SellingMethod.negotiate:
        return '${merchandise.priceRange}';
      default:
        return 'Unable to retrieve selling method';
    }
  }

  String formatText(SellingMethod method) {
    switch (method) {
      case SellingMethod.selling:
        return 'Price ';
      case SellingMethod.trading:
        return 'Trading for\n';
      case SellingMethod.negotiate:
        return 'Price Range ';
      default:
        return 'Unable to retrieve selling method';
    }
  }
}
