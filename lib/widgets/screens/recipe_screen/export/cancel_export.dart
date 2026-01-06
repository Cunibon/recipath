import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/screens/recipe_screen/export/dialogs/cancel_export_dialog.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/export_notifier.dart';

class CancelExport extends ConsumerWidget {
  const CancelExport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final cancel = await showDialog<bool>(
          context: context,
          builder: (context) => CancelExportDialog(),
        );

        if (cancel == true) {
          ref.read(exportProvider.notifier).clear();
        }
      },
      icon: Icon(Icons.clear),
    );
  }
}
