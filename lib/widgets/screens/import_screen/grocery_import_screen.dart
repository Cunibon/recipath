import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_grocery_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_notifier.dart';

class GroceryImportScreen extends ConsumerWidget {
  const GroceryImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(importScreenProvider(filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newItems = state.value!.importGroceryLookup.entries.where(
            (e) => e.key == e.value.id,
          );
          if (newItems.isNotEmpty) {
            final result = await showDialog<bool>(
              context: context,
              builder: (context) =>
                  ConfirmGroceryCreationDialog(count: newItems.length),
            );

            if (result != true) return;
          }

          await ref
              .read(importScreenProvider(state.value!.path).notifier)
              .commit();
          if (context.mounted) {
            context.go(RootRoutes.recipeRoute.path);
          }
        },
        child: Icon(Icons.check),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CachedAsyncValueWrapper(
          asyncState: state,
          builder: (data) => Column(
            crossAxisAlignment: .start,
            children: [
              InfoText(text: localization.groceryImportInfo),
              Expanded(child: GroceryImport(data: data)),
            ],
          ),
        ),
      ),
    );
  }
}
