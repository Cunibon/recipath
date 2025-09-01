import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/color_extension.dart';
import 'package:recipath/widgets/providers/material_you_scheme_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/dark_mode_provider.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/material_you_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_data_notifier.g.dart';

@riverpod
ThemeData themeDataNotifier(Ref ref) {
  final darkMode = ref.watch(darkModeNotifierProvider);
  final materialYou = ref.watch(materialYouNotifierProvider);

  ThemeData startTheme = darkMode ? ThemeData.dark() : ThemeData.light();

  if (materialYou) {
    final materialColorScheme = ref
        .watch(materialYouSchemeNotifierProvider)
        .value;

    if (materialColorScheme != null) {
      final modifiedColorScheme = materialColorScheme.copyWith(
        surfaceContainer: darkMode
            ? materialColorScheme.surfaceContainer.lighten(0.05)
            : materialColorScheme.surfaceContainer.darken(0.01),
      );

      startTheme = ThemeData(
        colorScheme: modifiedColorScheme,
        brightness: modifiedColorScheme.brightness,
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
