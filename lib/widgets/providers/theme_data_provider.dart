import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/providers/material_you_scheme_provider.dart';
import 'package:recipe_list/widgets/screens/settings_screen/providers/dark_mode_provider.dart';
import 'package:recipe_list/widgets/screens/settings_screen/providers/material_you_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data_provider.g.dart';

@riverpod
ThemeData themeDataNotifier(Ref ref) {
  final darkMode = ref.watch(darkModeProviderProvider);
  final materialYou = ref.watch(materialYouProviderProvider);

  ThemeData startTheme = darkMode ? ThemeData.dark() : ThemeData.light();

  if (materialYou) {
    final materialColorScheme = ref
        .watch(materialYouSchemeNotifierProvider)
        .value;

    if (materialColorScheme != null) {
      startTheme = ThemeData(
        colorScheme: materialColorScheme,
        brightness: materialColorScheme.brightness,
      );
    }
  }

  return startTheme.copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: startTheme.colorScheme.primaryContainer,
        foregroundColor: startTheme.colorScheme.onPrimaryContainer,
      ),
    ),
    cardTheme: CardThemeData(color: startTheme.colorScheme.surfaceContainer),
  );
}
