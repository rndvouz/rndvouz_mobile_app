import 'package:app/onboarding_process/sign_up_size.dart';
import 'package:app/onboarding_process/sign_up_top_bar.dart';
import 'package:flutter/material.dart';

class SignUpStyle extends StatefulWidget {
  const SignUpStyle({super.key});

  @override
  _SignUpStyleState createState() => _SignUpStyleState();
}

class _SignUpStyleState extends State<SignUpStyle> {
  @override
  Widget build(BuildContext context) {
    const String step = 'style';

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SignUpTopBar(state: step),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("The style step"),
                const SizedBox(height: 200.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpSize()));
                              },
                              child: const Text('Next'),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
