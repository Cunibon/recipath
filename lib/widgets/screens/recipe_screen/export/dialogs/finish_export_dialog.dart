import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/recipe_notifier.dart';

class FinishExportDialog extends ConsumerWidget {
  const FinishExportDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final recipeMap = ref.watch(recipeProvider).value;
    final export = ref.watch(exportProvider)!;

    final recipes = export.map((e) => recipeMap?[e]).nonNulls;

    return TwoOptionDialog(
      title: localization.finishExport,
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization.theseRecipesHaveBeenAdded,
              style: TextTheme.of(context).bodyLarge,
            ),
            for (final recipe in recipes) Text("● ${recipe.title}"),
          ],
        ),
      ),
      agree: localization.actionContinue,
      disagree: localization.actionCancel,
    );
  }
}
