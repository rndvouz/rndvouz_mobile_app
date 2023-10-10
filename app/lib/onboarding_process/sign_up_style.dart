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
    const OutlinedBorder roundBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)));

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SignUpTopBar(state: step),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16, right: 16, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("The style step"),
                    const SizedBox(height: 200.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpSize()));
                              },
                              child: const Text('Next'),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
