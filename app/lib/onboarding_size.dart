import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'dart:developer' as developer;

class OnBoardingSize extends StatefulWidget {
  OnBoardingSize({super.key});

  @override
  _OnBoardingSizeState createState() => _OnBoardingSizeState();
}

class _OnBoardingSizeState extends State<OnBoardingSize> {
  Widget _setMeasurementBuilder(String label, int val, int min, int max) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text(label),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () =>
                          setState(() {
                            final int newVal = val - 1;
                            val = newVal.clamp(min, max);
                          }),
                    ),
                  ],
                ),
                Column(
                  children: [
                    NumberPicker(
                      axis: Axis.horizontal,
                      itemWidth: 90,
                      value: val,
                      minValue: min,
                      maxValue: max,
                      onChanged: (newVal) {
                        setState(() => val = newVal);
                      },
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black26),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () =>
                          setState(() {
                            final int newVal = val + 1;
                            val = newVal.clamp(min, max);
                          }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25)
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(
          children: [
            _setMeasurementBuilder('Bust', 35, 15, 50),
            _setMeasurementBuilder('Waist', 27, 15, 50),
            _setMeasurementBuilder('Hips', 38, 15, 50),
            _setMeasurementBuilder('Inseam', 28, 15, 50),
            _setMeasurementBuilder('Sleeve Length', 24, 15, 50),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(140.0, 48.0)),
                      child: Text('Back'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(140.0, 48.0)),
                      child: Text('Finished'),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
