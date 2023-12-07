import 'package:flutter/material.dart';

import '../../common/data/colors.dart';
import '../../merchandise/domain/merchandise.dart';

class NewSwipeCard extends StatelessWidget {
  const NewSwipeCard(
      {required this.merchandise,
      // required this.setup,
      required this.cardStyle,
      Key? key})
      : super(key: key);

  final Merchandise merchandise;
  // final bool setup;
  final String cardStyle;
  // final List<String> options = <String>['setup', 'swipe', 'match'];

  @override
  Widget build(BuildContext context) {
    final merchandiseImage = Image.asset(
      "${merchandise.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );

    double heightSet = 420;
    double widthSet = 280;
    double labelSet = 80;
    // double topSet;

    if (cardStyle == "setup") {
      heightSet = 400;
      // topSet = 300;
    } else if (cardStyle == "swipe") {
      heightSet = 420;
      // topSet = 320;
    } else if (cardStyle == "match") {
      heightSet = 340;
      widthSet = 215;
      labelSet = 70;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Container(
          height: heightSet,
          width: widthSet,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15.0,
                // spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: merchandiseImage,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: labelSet,
                    width: widthSet,
                    decoration: const ShapeDecoration(
                      color: colorCream2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          merchandise.merchName,
                        ),
                      ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
