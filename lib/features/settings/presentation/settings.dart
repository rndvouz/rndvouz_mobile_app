import 'package:rndvouz/features/settings/data/theme_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rndvouz/features/user/data/user_providers.dart';
import 'package:rndvouz/repositories/firestore/firestore_providers.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curTheme = ref.watch(curThemeModeStateProvider);
    final auth = ref.watch(firebaseAuthProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<ThemeMode>(
                  value: curTheme,
                  items: const [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('System Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    )
                  ],
                  onChanged: (value) {
                    ref.read(curThemeModeStateProvider.notifier).state = value!;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    auth.signOut();
                  },
                  child: const Text("Log Out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
