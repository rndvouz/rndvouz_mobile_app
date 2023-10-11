import 'package:app/home_screen/home_bottom_nav_bar.dart';
import 'package:app/login_page.dart';

import 'package:flutter/material.dart';

import 'colors.dart';
import 'setup_process/individual/individual_complete.dart';
import 'setup_process/individual/individual_login.dart';
import 'setup_process/individual/individual_size.dart';
import 'setup_process/individual/individual_style.dart';
import 'setup_process/individual/individual_swipe.dart';

final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: colorGreen1,
        secondary: colorBrown1,
        error: errorRed,
      ),
      useMaterial3: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
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
      ));
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
        '/ind_setup_size': (BuildContext context) =>
            const IndividualSetupSize(),
        '/ind_setup_login': (BuildContext context) =>
            const IndividualSetupLogin(),
        '/ind_setup_swipe': (BuildContext context) =>
            const IndividualSetupSwipe(),
        '/ind_setup_style': (BuildContext context) =>
            const IndividualSetupStyle(),
        '/ind_setup_complete': (BuildContext context) =>
            IndividualSetupComplete(),
        '/': (BuildContext context) => const HomeBottomNavBar(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
