import 'package:app/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

class Settings extends ConsumerWidget {
  Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curTheme = ref.watch(curThemeModeStateProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(curTheme.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(curThemeModeStateProvider.notifier).state =
                      curTheme == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                child: Text('Change')),
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
          ],
        ),
      ),
    );
  }
}
