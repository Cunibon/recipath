import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/dark_mode_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_you_scheme_notifier.g.dart';

@riverpod
Future<ColorScheme?> materialYouSchemeNotifier(Ref ref) async {
  final darkMode = ref.watch(darkModeProvider);
  final corePalette = await DynamicColorPlugin.getCorePalette();

  return corePalette?.toColorScheme(
    brightness: darkMode ? Brightness.dark : Brightness.light,
  );
}
