import 'package:rndvouz/features/home/presentation/home_bottom_nav_bar.dart';
import 'package:rndvouz/features/authentication/presentation/login_page.dart';
import 'package:rndvouz/features/settings/data/theme_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/settings/presentation/app_theme.dart';

import 'package:flutter/material.dart';

class RndvouzApp extends ConsumerWidget {
  const RndvouzApp({Key? key}) : super(key: key);

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
        '/login': (BuildContext context) => const LoginPage(),
        //'/login': (BuildContext context) => Settings(),
        '/': (BuildContext context) => const HomeBottomNavBar(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
