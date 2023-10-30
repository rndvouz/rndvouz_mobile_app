import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ThemeMode curThemeMode = ThemeMode.system;

final curThemeModeStateProvider =
    StateProvider<ThemeMode>((ref) => curThemeMode);