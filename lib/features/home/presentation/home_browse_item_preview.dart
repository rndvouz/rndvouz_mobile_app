import 'package:flutter/material.dart';
import 'package:rndvouz/features/common/domain/measurements.dart';
import 'package:rndvouz/features/merchandise/domain/merchandise.dart';

import '../../common/data/colors.dart';

class HomeBrowseItemPreview extends StatefulWidget {
  final Merchandise merchandise;

  const HomeBrowseItemPreview({Key? key, required this.merchandise})
      : super(key: key);

  @override
  HomeBrowseItemPreviewState createState() => HomeBrowseItemPreviewState();
}

class HomeBrowseItemPreviewState extends State<HomeBrowseItemPreview> {
  bool isLiked = false;
  bool isClicked = false;
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
          "${widget.merchandise.merchName}",
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
              padding: EdgeInsets.only(top: 25.0, left: 25.0, bottom: 25.0),
              child: Text(
                "${widget.merchandise.ownerUsername}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              "${widget.merchandise.assetImages}.jpg",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : null,
                        ),
                        onPressed: () {
                          print('Like button pressed');
                          setState(() {
                            isLiked = !isLiked;
                            print(isLiked);
                            UpdateLike(isLiked);
                          });
                        },
                      ),

                      Text('${widget.merchandise.likes}'),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                        isClicked? Icons.bookmark
                        : Icons.bookmark_border
                    ),
                    onPressed: () {
                      print("Bookmark button pressed");
                      setState(() {
                        isClicked = !isClicked;
                        // Save to User's profile for bookmarked items
                      });
                    },
                  ),
                ],
              ),
            ),
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
                            "${formatAvailability(widget.merchandise.state)}",
                          ),
                          shape: roundBorder,
                          backgroundColor: colorGreen2,
                        ),
                        SizedBox(width: 8.0),
                        Chip(
                          label: Text(
                              "${formatSellingMethod(widget.merchandise.sellingMethod)}"),
                          shape: roundBorder,
                          backgroundColor: colorGreen2,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("${formatText(widget.merchandise.sellingMethod)}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "${formatSellingDisplay(widget.merchandise.sellingMethod)}",
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text("Description",
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
                        Text("Measurements",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          formatMeasurements(
                              widget.merchandise.merchMeasurements),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          'Comments',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'No comments yet',
                            style: TextStyle(
                              color: Colors.grey, // Light gray color
                            ),
                          ),
                          // Populate comments here
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              child: TextField(
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: '   Type your comment..',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              // Handle like button click
                            },
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

  void UpdateLike(bool liked) {
    setState(() {
      if (liked) {
        widget.merchandise.likes += 1; // Increment likes
      } else {
        widget.merchandise.likes -= 1; // Decrement likes
      }
    });
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
    final minPrice = widget.merchandise.priceRange?.minPrice;
    final maxPrice = widget.merchandise.priceRange?.maxPrice;

    switch (method) {
      case SellingMethod.selling:
        return '\$${widget.merchandise.price}';
      case SellingMethod.trading:
        return '${widget.merchandise.desiredTrade}';
      case SellingMethod.negotiate:
        return '\$${minPrice ?? 'N/A'} - \$${maxPrice ?? 'N/A'}';
      default:
        return 'Unable to retrieve selling method';
    }
  }

  String formatText(SellingMethod method) {
    switch (method) {
      case SellingMethod.selling:
        return 'Price ';
      case SellingMethod.trading:
        return 'Trading for ';
      case SellingMethod.negotiate:
        return 'Price Range ';
      default:
        return 'Unable to retrieve selling method';
    }
  }

  String formatMeasurements(Measurements measurements) {
    final List<String> lines = [];

    if (measurements.bust != null) {
      lines.add('Bust: ${measurements.bust}"');
    }
    if (measurements.waist != null) {
      lines.add('Waist: ${measurements.waist}"');
    }
    if (measurements.hips != null) {
      lines.add('Hips: ${measurements.hips}"');
    }
    if (measurements.inseam != null) {
      lines.add('Inseam: ${measurements.inseam}"');
    }
    if (measurements.sleeveLength != null) {
      lines.add('Sleeve Length: ${measurements.sleeveLength}"');
    }
    if (measurements.length != null) {
      lines.add('Full Length: ${measurements.length}"');
    }

    return lines.join('\n');
  }
}
