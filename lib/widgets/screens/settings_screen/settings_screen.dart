import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/supabase/supabase_user_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/dark_mode_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/locale_picker.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/material_you_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/storage_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/auth/manage_supscription_button.dart';
import 'package:recipath/widgets/screens/settings_screen/data/ai_token.dart';
import 'package:recipath/widgets/screens/settings_screen/data/change_password.dart';
import 'package:recipath/widgets/screens/settings_screen/data/clear_all_data.dart';
import 'package:recipath/widgets/screens/settings_screen/data/delete_account.dart';
import 'package:recipath/widgets/screens/settings_screen/data/privacy_policy.dart';
import 'package:recipath/widgets/screens/settings_screen/data/terms_of_use.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/version_tag.dart';
import 'package:recipath/widgets/screens/settings_screen/setting_section.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    return NavigationDrawerScaffold(
      titleBuilder: (title) => DefaultNavigationTitle(title: title),
      body: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            SettingSection(
              title: localization.appearance,
              children: [
                LocalePicker(),
                DarkModeToggle(),
                if (Platform.isAndroid) MaterialYouToggle(),
                StorageToggle(),
              ],
            ),
            SettingSection(
              title: localization.data,
              children: [
                AiToken(),
                PrivacyPolicy(),
                if (Platform.isIOS) TermsOfUse(),
                if (ref.watch(supabaseUserProvider) == null)
                  ClearAllData()
                else ...[
                  ChangePassword(),
                  DeleteAccount(),
                ],
              ],
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
