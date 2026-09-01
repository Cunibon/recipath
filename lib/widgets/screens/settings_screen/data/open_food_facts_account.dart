import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/delete_confirmation_dialog.dart';
import 'package:recipath/widgets/providers/open_food_facts/open_food_facts_account_notifier.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/open_food_facts_account_dialog.dart';

class OpenFoodFactsAccount extends ConsumerWidget {
  const OpenFoodFactsAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountData = ref.watch(openFoodFactsAccountProvider).value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () async {
            final result = await showDialog<OpenFoodFactsAccountData>(
              context: context,
              builder: (context) =>
                  OpenFoodFactsAccountDialog(accountData: accountData),
            );

            if (result != null) {
              ref.read(openFoodFactsAccountProvider.notifier).set(result);
            }
          },
          icon: const Icon(Icons.public),
          label: Text(AppLocalizations.of(context)!.openFoodFactsAccount),
        ),
        if (accountData != null)
          IconButton(
            onPressed: () async {
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => const DeleteConfirmationDialog(),
              );

              if (result == true) {
                ref.read(openFoodFactsAccountProvider.notifier).set(null);
              }
            },
            icon: const Icon(Icons.delete),
          ),
      ],
    );
  }
}
