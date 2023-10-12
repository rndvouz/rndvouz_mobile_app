import 'package:app/data_model/user_db.dart';
import 'package:app/setup_process/setup_complete.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'setup_top_bar.dart';

class IndividualSetupSize extends StatefulWidget {
  final User newUser;

  const IndividualSetupSize({Key? key, required this.newUser})
      : super(key: key);

  @override
  SignUpSizeState createState() => SignUpSizeState();
}

class SignUpSizeState extends State<IndividualSetupSize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SetupTopBar(state: 'measurements'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 15, right: 15, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _setMeasurementBuilder('Bust', 35, 15, 50),
                    _setMeasurementBuilder('Waist', 27, 15, 50),
                    _setMeasurementBuilder('Hips', 38, 15, 50),
                    _setMeasurementBuilder('Inseam', 28, 15, 50),
                    _setMeasurementBuilder('Sleeve Length', 24, 15, 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(140.0, 48.0)),
                              child: Text('Back'),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SetupComplete(
                                            newUser: widget.newUser)),
                                    (r) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(140.0, 48.0)),
                              child: Text('Finished'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Builder method
  Widget _setMeasurementBuilder(String label, int val, int min, int max) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => setState(() {
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
                      itemWidth: 80,
                      // itemWidth: screenWidth * 0.1,
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
                      onPressed: () => setState(() {
                        final int newVal = val + 1;
                        val = newVal.clamp(min, max);
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}