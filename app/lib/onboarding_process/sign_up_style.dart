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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SignUpTopBar(state: step),
          const Text("The style step"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpTopBar(state: 'login')));
            },
            child: const Text('Next'),
          ),
        ],
      )),
    );
  }
}
