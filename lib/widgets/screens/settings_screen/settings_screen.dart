import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/dark_mode_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/locale_picker.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/material_you_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/auth/manage_supscription_button.dart';
import 'package:recipath/widgets/screens/settings_screen/data/export_button.dart';
import 'package:recipath/widgets/screens/settings_screen/data/import_button.dart';
import 'package:recipath/widgets/screens/settings_screen/data/privacy_policy.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/version_tag.dart';
import 'package:recipath/widgets/screens/settings_screen/setting_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return NavigationDrawerScaffold(
      titleBuilder: (title) =>
          DefaultNavigationTitle(title: title, syncState: SyncState.synced),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            SettingSection(
              title: localization.appearance,
              children: [LocalePicker(), DarkModeToggle(), MaterialYouToggle()],
            ),
            SettingSection(
              title: localization.data,
              children: [ImportButton(), ExportButton(), PrivacyPolicy()],
            ),
            SettingSection(
              title: localization.subscription,
              children: [ManageSupscriptionButton()],
            ),
            VersionTag(),
          ],
        ),
      ),
    );
  }
}
