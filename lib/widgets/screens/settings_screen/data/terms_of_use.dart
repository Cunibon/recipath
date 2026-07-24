import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsOfUse extends ConsumerWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: () => launchUrl(
        Uri.parse(
          "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/",
        ),
      ),
      icon: Icon(Icons.description),
      label: Text(AppLocalizations.of(context)!.termsOfUse),
    );
  }
}
