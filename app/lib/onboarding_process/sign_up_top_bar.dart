import 'package:app/colors.dart';
import 'package:flutter/material.dart';

class SignUpTopBar extends StatelessWidget {
  final String state;

  SignUpTopBar({super.key, required this.state});

  final individual = [
    {
      'state': 'Login',
      'title': 'Set Up Your Login',
      'description':
          'This information will be used to login to \n your account.',
    },
    {
      'state': 'Profile',
      'title': 'Set Up Your Profile',
      'description':
          'This information will be displayed on \n your account to help others identify you.',
    },
    {
      'state': 'Swipe',
      'title': 'Swipe!',
      'description':
          'Swipe left if you don\'t like the item and right if you do. This will help us gauge your sense of style!',
    },
    {
      'state': 'Style',
      'title': 'Select Your Style Interests',
      'description':
          'Select the styles that you want to see! This will help us cater the app to your interests!',
    },
    {
      'state': 'Measurements',
      'title': 'Add Your Measurements',
      'description':
          'Add your measurements to help us find clothes that\'ll be a good fit!',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final field = getField();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SizedBox(
            height: 125,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          field['title']!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            field['description']!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          color: colorCream2,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var label in individual)
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  color: label['state']!.toLowerCase() == state
                      ? colorGreen1
                      : colorCream2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(label['state']!)],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Map<String, String> getField() {
    switch (state) {
      case 'login':
        return individual[0];
      case 'profile':
        return individual[1];
      case 'swipe':
        return individual[2];
      case 'style':
        return individual[3];
      case 'measurements':
        return individual[4];
      default:
        throw Exception('Invalid state for SignUpTopBar, check parameter.');
    }
  }
}
