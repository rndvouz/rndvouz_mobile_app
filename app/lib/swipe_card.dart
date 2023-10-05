import 'package:flutter/material.dart';

import '../model/merchandise.dart';

class SwipeCard extends StatelessWidget {
  const SwipeCard(
      {this.imageAspectRatio = 7 / 7, required this.merchandise, Key? key})
      : assert(imageAspectRatio > 0),
        super(key: key);

  final double imageAspectRatio;
  final Merchandise merchandise;

  static const kTextBoxHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final imageWidget = Image.asset(
      // merchandise.merchName,
      "${merchandise.assetImages}.jpg",
      fit: BoxFit.cover,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.all(
          4.0,
        )),
        SizedBox(
            height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor,
            width: 400.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  merchandise.merchName,
                  style: theme.textTheme.labelLarge,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 20.0),
              ],
            )),
        AspectRatio(
          // Image
          aspectRatio: imageAspectRatio,
          child: imageWidget,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
