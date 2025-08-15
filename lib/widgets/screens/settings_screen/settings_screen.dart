import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/navigation/default_navigation_title.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/settings_screen/data/export_button.dart';
import 'package:recipe_list/widgets/screens/settings_screen/data/import_button.dart';
import 'package:recipe_list/widgets/screens/settings_screen/setting_section.dart';
import 'package:recipe_list/widgets/screens/settings_screen/theme/dark_mode_toggle.dart';
import 'package:recipe_list/widgets/screens/settings_screen/theme/material_you_toggle.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: Column(
        children: [
          SettingSection(
            title: "Theme",
            children: [DarkModeToggle(), MaterialYouToggle()],
          ),
          SettingSection(
            title: "Data",
            children: [ImportButton(), ExportButton()],
          ),
        ],
      ),
    );
  }
}
