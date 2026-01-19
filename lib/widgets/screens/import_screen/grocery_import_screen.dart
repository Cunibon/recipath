import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/dialogs/confirm_creation_dialog.dart';
import 'package:recipath/widgets/screens/import_screen/grocery_import.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/providers/grocery_import_screen_notifier.dart';

class GroceryImportScreen extends ConsumerWidget {
  const GroceryImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(groceryImportScreenProvider(filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final willCreate = state.value!.entries.where((e) => e.value == null);
          if (willCreate.isNotEmpty) {
            final result = await showDialog<bool>(
              context: context,
              builder: (context) => ConfirmCreationDialog(
                count: willCreate.length,
                type: localization.groceries,
              ),
            );

            if (result != true) return;
          }

          if (context.mounted) {
            context.goRelative(ImportRoutes.tagImport.path, extra: filePath);
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
              InfoText(text: localization.groceryImportInfo),
              Expanded(child: GroceryImport(filePath: filePath)),
            ],
          ),
        ),
      ),
    );
  }
}
