import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/export/dialogs/finish_export_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';

class FinishExport extends ConsumerWidget {
  const FinishExport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final result = await showDialog(
          context: context,
          builder: (context) => FinishExportDialog(),
        );

        if (result == true) {
          ref.read(exportProvider.notifier).export();
        }
      },
      icon: Icon(Icons.done),
    );
  }
}
