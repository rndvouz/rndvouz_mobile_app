import 'package:app/home_screen/home_screen.dart';
import 'package:app/login_page.dart';
import 'package:app/onboarding_process/onboarding_swipe.dart';
import 'package:app/onboarding_process/sign_up_login.dart';
import 'package:app/onboarding_process/sign_up_style.dart';
import 'package:app/setup_complete.dart';
import 'package:app/onboarding_process/sign_up_size.dart';


import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: colorGreen1,
      secondary: colorBrown1,
      error: errorRed,
    ),
    scaffoldBackgroundColor: colorCream1,
    appBarTheme: AppBarTheme(
      backgroundColor: colorCream1,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorGreen1,
    ),
    cardTheme: CardTheme(
      color: colorCream2,
    )
  );
}

class RndvouzApp extends StatelessWidget {
  const RndvouzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rndvouz App',
      initialRoute: '/login',
      theme: _appTheme,
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/signup_size': (BuildContext context) => const SignUpSize(),
        '/signup_login': (BuildContext context) => const SignUpLogin(),
        '/signup_swipe': (BuildContext context) => OnBoardingSwipe(),
        '/signup_style': (BuildContext context) => const SignUpStyle(),
        '/setup_complete': (BuildContext context) => SetupComplete(),
        '/': (BuildContext context) => const Homescreen(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
