import 'package:app/homescreen.dart';
import 'package:app/login_page.dart';
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
    scaffoldBackgroundColor: colorCream,
    appBarTheme: const AppBarTheme(
      backgroundColor: colorCream,
    ),
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
        '/homescreen': (BuildContext context) => const Homescreen(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
