import 'package:rndvouz/features/settings/data/theme_providers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curTheme = ref.watch(curThemeModeStateProvider);

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
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/login", (r) => false);
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
