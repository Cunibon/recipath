import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/screens/settings_screen/providers/dark_mode_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_you_scheme_provider.g.dart';

@riverpod
Future<ColorScheme?> materialYouSchemeNotifier(Ref ref) async {
  final darkMode = ref.watch(darkModeNotifierProvider);
  final corePalette = await DynamicColorPlugin.getCorePalette();

  return corePalette?.toColorScheme(
    brightness: darkMode ? Brightness.dark : Brightness.light,
  );
}
