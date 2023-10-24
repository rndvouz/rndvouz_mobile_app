import 'package:flutter/material.dart';

import 'colors.dart';


class AppTheme {
  static final ThemeData lightTheme = _buildAppTheme('light');
  static final ThemeData darkTheme = _buildAppTheme('dark');
}

ThemeData _buildAppTheme(String mode) {
  late ThemeData base;

  if (mode == 'light') {
    base = ThemeData.light();
  } else if (mode == 'dark') {
    base = ThemeData.dark();
  }

  return base.copyWith(
    // colorScheme: base.colorScheme.copyWith(
    //   primary: colorGreen1,
    //   secondary: colorBrown1,
    //   error: errorRed,
    // ),
    // useMaterial3: false,
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    // hoverColor: Colors.transparent,
    // scaffoldBackgroundColor: colorCream1,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: colorCream1,
    //   titleTextStyle: TextStyle(
    //     color: Colors.black,
    //   ),
    // ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: colorGreen1,
    // ),
    // cardTheme: CardTheme(
    //   color: colorCream2,
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //     style: ButtonStyle(
    //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //             RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(25.0),
    // )))),
  );
}
