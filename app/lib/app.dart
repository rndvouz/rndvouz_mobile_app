import 'package:app/home_screen/home_screen.dart';
import 'package:app/login_page.dart';
import 'package:app/onboarding_process/onboarding_swipe.dart';
import 'package:app/onboarding_process/sign_up_login.dart';
import 'package:app/onboarding_process/sign_up_style.dart';
import 'package:app/setup_complete.dart';
import 'package:app/onboarding_process/sign_up_size.dart';

import 'package:flutter/material.dart';

class RndvouzApp extends StatelessWidget {
  const RndvouzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rndvouz App',
      initialRoute: '/login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/signup_size': (BuildContext context) => const SignUpSize(),
        '/signup_login': (BuildContext context) => const SignUpLogin(),
        '/signup_swipe': (BuildContext context) => OnBoardingSwipe(),
        '/signup_style': (BuildContext context) => const SignUpStyle(),
        '/homescreen': (BuildContext context) => const Homescreen(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
