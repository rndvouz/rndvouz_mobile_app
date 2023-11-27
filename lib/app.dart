import 'package:rndvouz/features/authentication/presentation/await_verify.dart';
import 'package:rndvouz/features/authentication/presentation/login_page.dart';
import 'package:rndvouz/features/authentication/presentation/setup_login.dart';
import 'package:rndvouz/features/common/data/global_navigator_key.dart';
import 'package:rndvouz/features/common/presentation/global_snackbar.dart';
import 'package:rndvouz/features/home/presentation/home_bottom_nav_bar.dart';
import 'package:rndvouz/features/merchandise/domain/add_merch.dart';
import 'package:rndvouz/features/settings/data/theme_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/setup_process/presentation/get_started.dart';
import 'package:rndvouz/features/setup_process/presentation/individual/individual_setup_size.dart';
import 'package:rndvouz/features/setup_process/presentation/individual/individual_setup_swipe.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_complete.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_profile.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_style.dart';
import 'features/settings/presentation/app_theme.dart';

import 'package:flutter/material.dart';

class RndvouzApp extends ConsumerWidget {
  const RndvouzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final curThemeMode = ref.watch(curThemeModeStateProvider);
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
        SetupProfilePage.routeName: (BuildContext context) =>
            const SetupProfilePage(),
        GetStartedPage.routeName: (BuildContext context) =>
            const GetStartedPage(),
        IndividualSetupSwipe.routeName: (BuildContext context) =>
            const IndividualSetupSwipe(),
        SetupStyle.routeName: (BuildContext context) => const SetupStyle(),
        IndividualSetupSize.routeName: (BuildContext context) =>
            const IndividualSetupSize(),
        SetupComplete.routeName: (BuildContext context) =>
            const SetupComplete(),
      },
    );

    // Build Rndouz App Theme

    // Build Rndvouz Text Theme
  }
}
