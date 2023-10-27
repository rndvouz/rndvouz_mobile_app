import 'package:flutter/material.dart';

import 'colors.dart';
import 'data_model/merchandise.dart';

class NewSwipeCard extends StatelessWidget {
  const NewSwipeCard({required this.merchandise, required this.setup, Key? key})
      : super(key: key);

  final Merchandise merchandise;
  final bool setup;

  @override
  Widget build(BuildContext context) {
    final merchandiseImage = Image.asset(
      "${merchandise.assetImages}.jpg",
      fit: BoxFit.fitHeight,
    );

    double heightSet;
    double topSet;

    if (setup) {
      heightSet = 400;
      topSet = 300;
    } else {
      heightSet = 420;
      topSet = 320;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100),
        Container(
          height: heightSet,
          width: 280,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15.0,
                // spreadRadius: 2,
                offset: Offset(0, 4),
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
                  // top: topSet,
                  child: Container(
                    height: 80,
                    width: 280,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
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
