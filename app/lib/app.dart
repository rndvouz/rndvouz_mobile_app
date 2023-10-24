import 'package:app/home_screen/home_bottom_nav_bar.dart';
import 'package:app/main.dart';
import 'package:app/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_theme.dart';

import 'package:flutter/material.dart';

class RndvouzApp extends ConsumerWidget {
  RndvouzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curThemeMode = ref.watch(curThemeModeStateProvider);

    return MaterialApp(
      title: 'Rndvouz App',
      initialRoute: '/login',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: curThemeMode,
      routes: {
        //'/login': (BuildContext context) => LoginPage(),
        '/login': (BuildContext context) => Settings(),
        '/': (BuildContext context) => const HomeBottomNavBar(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
