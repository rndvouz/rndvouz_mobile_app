import 'package:app/colors.dart';
import 'package:app/onboarding_process/onboarding_swipe.dart';
import 'package:app/onboarding_process/setup_login_page.dart';
import 'package:app/onboarding_process/setup_profile_page.dart';
import 'package:app/onboarding_process/sign_up_size.dart';
import 'package:app/onboarding_process/sign_up_style.dart';
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
      'title': 'Select Your Style',
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

  final business = [
    {
      'state': 'Login',
      'title': 'Set Up Your Business Login',
      'description':
          'This information will be used to login to \n your account.',
    },
    {
      'state': 'Profile',
      'title': 'Set Up Your Business Profile',
      'description':
          'This information will be displayed on \n your account to help others identify your business faster.',
    },
    {
      'state': 'Style',
      'title': 'Select Your Style',
      'description': 'Select styles that best aligns with your business.',
    },
    {
      'state': 'Contact',
      'title': 'Contact Information',
      'description':
          'Add the contact information of your business representatives in case we need to get in touch with you!',
    },
    {
      'state': 'Verify',
      'title': 'Business Verification',
      'description':
          'Please take time to review the Terms & Conditions and give us a moment to review your account for approval.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final field = getField();

    int index = 0;
    for (int i = 0; i < individual.length; i++) {
      if (individual[i]['state']!.toLowerCase() == state) {
        index = i;
        break;
      }
    }

    final user = state.contains('Business') ? business : individual;

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
              for (int i = 0; i < user.length; i++)
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  color: i <= index ? colorGreen1 : colorCream2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(user[i]['state']!)],
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
      case 'loginBusiness':
        return business[0];
      case 'profileBusiness':
        return business[1];
      case 'styleBusiness':
        return business[2];
      case 'contactBusiness':
        return business[3];
      case 'verifyBusiness':
        return business[4];
      default:
        throw Exception('Invalid state for SignUpTopBar, check parameter.');
    }
  }
}
