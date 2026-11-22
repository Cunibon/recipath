import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/widgets/providers/backend/backend_config_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/navigation/default_navigation_title.dart';
import 'package:recipath/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipath/widgets/providers/backend/auth_user_notifier.dart';
import 'package:recipath/domain_service/subscription_service/subscription_service_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/dark_mode_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/locale_picker.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/material_you_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/appearance/storage_toggle.dart';
import 'package:recipath/widgets/screens/settings_screen/auth/manage_supscription_button.dart';
import 'package:recipath/widgets/screens/settings_screen/data/ai_token.dart';
import 'package:recipath/widgets/screens/settings_screen/data/change_password.dart';
import 'package:recipath/widgets/screens/settings_screen/data/clear_all_data.dart';
import 'package:recipath/widgets/screens/settings_screen/data/delete_account.dart';
import 'package:recipath/widgets/screens/settings_screen/data/open_food_facts_account.dart';
import 'package:recipath/widgets/screens/settings_screen/data/privacy_policy.dart';
import 'package:recipath/widgets/screens/settings_screen/data/supabase_config.dart';
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
                OpenFoodFactsAccount(),
                SupabaseConfig(),
                PrivacyPolicy(),
                if (Platform.isIOS) TermsOfUse(),
                if (ref.watch(authUserProvider).value == null)
                  ClearAllData()
                else ...[
                  ChangePassword(),
                  if (ref.watch(backendConfigProvider).value?.custom != true)
                    DeleteAccount(),
                ],
              ],
            ),
            if (ref
                    .watch(subscriptionServiceProvider)
                    .value
                    ?.purchasesAvailable ==
                true)
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
