import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends ConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () =>
          launchUrl(Uri.parse("https://firebon.de:8081/recipath/privacy/")),
      icon: Icon(Icons.policy),
      label: Text(AppLocalizations.of(context)!.privacyPolicy),
    );
  }
}
