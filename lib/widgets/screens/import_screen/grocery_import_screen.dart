import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_grocery_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';

class GroceryImportScreen extends ConsumerStatefulWidget {
  const GroceryImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  ConsumerState<GroceryImportScreen> createState() =>
      _GroceryImportScreenState();
}

class _GroceryImportScreenState extends ConsumerState<GroceryImportScreen> {
  late bool loading = false;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(groceryImportScreenProvider(widget.filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (loading) return;

          final willCreate = state.value!.entries.where((e) => e.value == null);
          if (willCreate.isNotEmpty) {
            final result = await showDialog<bool>(
              context: context,
              builder: (context) =>
                  ConfirmGroceryCreationDialog(count: willCreate.length),
            );

            if (result != true) return;
          }

          try {
            setState(() {
              loading = true;
            });
            await ref
                .read(groceryImportScreenProvider(widget.filePath).notifier)
                .commit();
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
              InfoText(text: localization.groceryImportInfo),
              Expanded(child: GroceryImport(filePath: widget.filePath)),
            ],
          ),
        ),
      ),
    );
  }
}
