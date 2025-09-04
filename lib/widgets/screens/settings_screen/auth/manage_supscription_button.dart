import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:recipath/l10n/app_localizations.dart';

class ManageSupscriptionButton extends StatelessWidget {
  const ManageSupscriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => RevenueCatUI.presentCustomerCenter(),
      icon: Icon(Icons.subscriptions),
      label: Text(AppLocalizations.of(context)!.manageSubscription),
    );
  }
}
