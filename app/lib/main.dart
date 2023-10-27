import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

ThemeMode curThemeMode = ThemeMode.system;

final curThemeModeStateProvider = StateProvider<ThemeMode>((ref) => curThemeMode);

void main() {
  runApp(const ProviderScope(
    child: RndvouzApp(),
  ));
}
