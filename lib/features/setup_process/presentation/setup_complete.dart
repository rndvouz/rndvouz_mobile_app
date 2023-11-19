import 'package:flutter/material.dart';
import 'package:rndvouz/features/user/domain/user.dart';

class SetupComplete extends StatelessWidget {
  static const String routeName = '/setupComplete';

  const SetupComplete({super.key});

  @override
  Widget build(BuildContext context) {
    final User newUser = ModalRoute.of(context)!.settings.arguments as User;
    final List<String> messages = [
      'Welcome, ${newUser.displayName}! Your account has been created!',
      'Thank you for registering your business to RNDVOUZ! It is now pending for review by our company. We will send you an email to let you know the status of your business in 3-5 business days.'
    ];
    final List<String> buttonText = ['Let\'s go!', 'Return to Login'];
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
                      context, '/home', (route) => false);
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
