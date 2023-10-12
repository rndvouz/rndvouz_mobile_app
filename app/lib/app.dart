import 'package:app/pages/home_screen/home_bottom_nav_bar.dart';
import 'package:app/pages/login.dart';

import 'package:flutter/material.dart';

import 'themes/colors.dart';

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
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    )))),
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
        '/': (BuildContext context) => const HomeBottomNavBar(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
