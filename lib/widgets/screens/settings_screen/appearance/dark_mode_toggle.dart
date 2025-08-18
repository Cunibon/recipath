import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/screens/settings_screen/providers/dark_mode_provider.dart';
import 'package:recipe_list/widgets/screens/settings_screen/setting_toggle.dart';

class DarkModeToggle extends ConsumerWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeNotifierProvider);

    return SettingToggle(
      text: AppLocalizations.of(context)!.darkMode,
      value: darkMode,
      onChanged: (value) =>
          ref.read(darkModeNotifierProvider.notifier).set(value),
    );
  }
}
