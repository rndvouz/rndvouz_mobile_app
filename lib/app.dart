import 'package:rndvouz/features/authentication/presentation/await_verify.dart';
import 'package:rndvouz/features/authentication/presentation/login_page.dart';
import 'package:rndvouz/features/authentication/presentation/setup_login.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/common/presentation/global_snackbar.dart';
import 'package:rndvouz/features/home/presentation/home_bottom_nav_bar.dart';
import 'package:rndvouz/features/home/presentation/home_browse.dart';
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
      scaffoldMessengerKey: GlobalSnackBar.key,
      navigatorKey: GlobalNavigatorKey.navigatorKey,
      title: 'Rndvouz App',
      initialRoute: '/login',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: curThemeMode,
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/verify': (BuildContext context) => const AwaitVerifyPage(),
        '/home': (BuildContext context) => const HomeBottomNavBar(),
        SetupLoginPage.routeName: (BuildContext context) =>
            const SetupLoginPage(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
