import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/widgets/screens/recipe_screen/export/dialogs/finish_export_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_recipe_action.dart';

class FinishExport extends ConsumerWidget {
  const FinishExport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final result = await showDialog<bool>(
          context: context,
          builder: (context) => FinishExportDialog(),
        );

        if (result == true) {
          final notifier = ref.read(exportProvider.notifier);
          await exportRecipeAction.run(ref);
          notifier.clear();
        }
      },
      icon: Icon(Icons.done),
    );
  }
}
