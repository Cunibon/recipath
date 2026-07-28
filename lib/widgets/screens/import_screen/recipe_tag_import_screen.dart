import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_service_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_tag_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/recipe_tag_import.dart';

class RecipeTagImportScreen extends ConsumerStatefulWidget {
  const RecipeTagImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  ConsumerState<RecipeTagImportScreen> createState() => _TagImportScreenState();
}

class _TagImportScreenState extends ConsumerState<RecipeTagImportScreen> {
  late bool loading = false;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(recipeTagImportScreenProvider(widget.filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: TextTheme.of(context).titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => ref
                .read(recipeTagImportScreenProvider(widget.filePath).notifier)
                .refresh(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (loading) return;

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
            setState(() {
              loading = true;
            });
            final service = await ref.read(
              importServiceProvider(widget.filePath).future,
            );

            await service.import();
            if (context.mounted) {
              context.go(RootRoutes.recipeRoute.path);
            }
          } finally {
            setState(() {
              loading = false;
            });
          }
        },
        child: loading ? CircularProgressIndicator() : Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CachedAsyncValueWrapper(
          asyncState: state,
          builder: (data) => Column(
            crossAxisAlignment: .start,
            children: [
              InfoText(text: localization.tagImportInfo),
              Expanded(child: RecipeTagImport(filePath: widget.filePath)),
            ],
          ),
        ),
      ),
    );
  }
}
