import 'package:flutter/material.dart';

import '../data_model/user_db.dart';

class SetupComplete extends StatelessWidget {
  final User newUser;

  SetupComplete({Key? key, required this.newUser}) : super(key: key);

  final List<String> messages = [
    'Welcome, <insert name here>! Your account has been created!',
    'Thank you for registering your business to RNDVOUZ! It is now pending for review by our company. We will send you an email to let you know the status of your business in 3-5 business days.'
  ];

  final List<String> buttonText = ['Let\'s go!', 'Return to Login'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Thank You!',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              Text(
                newUser.isBusiness ? messages[1] : messages[0],
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', ModalRoute.withName('/login'));
                },
                child: Text('Let\'s go!',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
