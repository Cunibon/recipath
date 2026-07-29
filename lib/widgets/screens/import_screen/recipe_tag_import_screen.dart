import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/providers/tag_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/tag_import.dart';

class RecipeTagImportScreen extends ConsumerWidget {
  const RecipeTagImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(tagImportScreenProvider(filePath, .recipe));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importRecipeTag,
          style: TextTheme.of(context).titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => ref
                .read(tagImportScreenProvider(filePath, .recipe).notifier)
                .refresh(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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

          if (context.mounted) {
            context.goRelative(
              ImportRoutes.groceryTagImport.path,
              extra: filePath,
            );
          }
        },
        child: Icon(Icons.arrow_forward),
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
                child: TagImport(filePath: filePath, tagType: .recipe),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
