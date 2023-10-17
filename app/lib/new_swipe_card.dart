import 'package:flutter/material.dart';

import 'colors.dart';
import 'data_model/merchandise.dart';

class NewSwipeCard extends StatelessWidget {
  const NewSwipeCard({required this.merchandise, Key? key}) : super(key: key);

  final Merchandise merchandise;

  @override
  Widget build(BuildContext context) {
    final merchandiseImage = Image.asset(
      "${merchandise.assetImages}.jpg",
      // fit: BoxFit.cover,
      fit: BoxFit.fitHeight,
    );

    return Container(
      height: 400,
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
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: merchandiseImage,
            ),
          ),
          Positioned(
            // bottom: 0,
            top: 300,
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    merchandise.merchName,
                  ),
                ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
