import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/providers/subscription/subscription_service_notifier.dart';

class ManageSupscriptionButton extends ConsumerWidget {
  const ManageSupscriptionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton.icon(
      onPressed: ref.watch(subscriptionServiceProvider).presentCustomerCenter,
      icon: Icon(Icons.subscriptions),
      label: Text(AppLocalizations.of(context)!.manageSubscription),
    );
  }
}
