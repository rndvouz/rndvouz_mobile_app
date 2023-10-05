import 'package:app/onboarding_process/sign_up_top_bar.dart';
import 'package:flutter/material.dart';

class SignUpLogin extends StatefulWidget {
  const SignUpLogin({super.key});

  @override
  _SignUpStyleLogin createState() => _SignUpStyleLogin();
}

class _SignUpStyleLogin extends State<SignUpLogin> {
  Widget build(BuildContext context) {
    const String step = 'login';

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
                      builder: (context) => SignUpTopBar(state: 'swipe')));
            },
            child: const Text('Next'),
          ),
        ],
      )),
    );
  }
}
