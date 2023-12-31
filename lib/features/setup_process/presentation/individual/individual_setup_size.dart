import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/common/domain/measurements.dart';
import 'package:rndvouz/features/user/data/user_db.dart';
import 'package:rndvouz/features/user/domain/user.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_complete.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../setup_top_bar.dart';

class IndividualSetupSize extends ConsumerWidget {
  static const String routeName = '/setupSize';

  const IndividualSetupSize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("setupSize");
    final UserDB userDB = ref.watch(userDBProvider);
    final newUser = ref.watch(currentUserProvider);
    return newUser.when(
      data: (user) {
        return _build(context, ref, user, userDB);
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stacktrace) => const Text("Something went wrong"),
    );
  }

  Widget _build(
      BuildContext context, WidgetRef ref, User newUser, UserDB userDB) {
    Measurements userMeasurements = Measurements(
        bust: 34,
        waist: 26,
        hips: 37,
        inseam: 28,
        sleeveLength: 24); // just hard code for this one now.
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SetupTopBar(state: 'size'),
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
                                  fixedSize: const Size(140.0, 48.0)),
                              child: const Text('Back'),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () async {
                                final updateUser = newUser.copyWith(
                                    userMeasurements: userMeasurements,
                                    setupStep: "completed");
                                await userDB.updateUser(updateUser);
                                GlobalNavigatorKey.navigatorKey.currentState!
                                    .pushNamed(SetupComplete.routeName,
                                        arguments: newUser);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(140.0, 48.0)),
                              child: const Text('Finished'),
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
                      icon: const Icon(Icons.arrow_back_ios),
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
                      icon: const Icon(Icons.arrow_forward_ios),
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
