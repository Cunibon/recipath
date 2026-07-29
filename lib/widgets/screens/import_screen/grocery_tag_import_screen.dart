import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/import_mutation.dart';
import 'package:recipath/widgets/screens/import_screen/providers/tag_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/tag_import.dart';

class GroceryTagImportScreen extends ConsumerWidget {
  const GroceryTagImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(tagImportScreenProvider(filePath, .grocery));

    final mutationState = ref.watch(importMutation);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importGroceryTag,
          style: TextTheme.of(context).titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => ref
                .read(tagImportScreenProvider(filePath, .grocery).notifier)
                .refresh(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (mutationState.isPending) return;

          final willCreate = state.value!.mappedTags.entries.where(
            (e) => e.value == null,
          );
          if (willCreate.isNotEmpty) {
            final result = await showDialog<bool>(
              context: context,
              builder: (context) => ConfirmCreationDialog(
                count: willCreate.length,
                type: localization.tags,
              ),
            );

            if (result != true) return;
          }

          try {
            await importMutation.run(ref, filePath);
            if (context.mounted) {
              context.go(RootRoutes.recipeRoute.path);
            }
          } finally {}
        },
        child: mutationState.isPending
            ? CircularProgressIndicator()
            : Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CachedAsyncValueWrapper(
          asyncState: state,
          builder: (data) => Column(
            crossAxisAlignment: .start,
            children: [
              InfoText(text: localization.tagImportInfo),
              Expanded(
                child: TagImport(filePath: filePath, tagType: .grocery),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
