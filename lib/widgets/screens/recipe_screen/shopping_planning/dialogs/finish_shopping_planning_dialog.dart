import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/shopping_planning_notifier.dart';

class FinishShoppingPlanningDialog extends ConsumerWidget {
  const FinishShoppingPlanningDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final shoppingPlan = ref.read(shoppingPlanningProvider)!;

    return TwoOptionDialog(
      title: localization.finishShoppingPlanning,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization.theseRecipesHaveBeenAdded,
              style: TextTheme.of(context).bodyLarge,
            ),
            for (final entry in shoppingPlan.entries)
              Text("● ${entry.value} ${entry.key.title}"),
          ],
        ),
      ),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
