import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class SignUpTopBar extends StatelessWidget {
  SignUpTopBar({super.key});

  final individual = [
    {
      'state': 'Login',
      'title': 'Set Up Your Login',
      'description': 'This information will be used to login to your account.',
    },
    {
      'state': 'Profile',
      'title': 'Set Up Your Profile',
      'description':
          'This information will be displayed on your account to help others identify you.',
    },
    {
      'state': 'Style',
      'title': 'Select Your Style Interests',
      'description':
          'Select the styles that you want to see! This will help us cater the app to your interests!',
    },
    {
      'state': 'Swipe',
      'title': 'Swipe!',
      'description':
          'Swipe left if you don\'t like the item and right if you do. This will help us gauge your sense of style!',
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Container(
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
                          'p',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            textAlign: TextAlign.center,
                            'Set your measurements for easier view of items similar to your size!',
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
          color: Colors.cyan,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var label in individual) Text(label['state']!),
            ],
          ),
        ),
      ],
    );
  }

  // Map<String, String> getField(){

  //   switch
  // }
}
