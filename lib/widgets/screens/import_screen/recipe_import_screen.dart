import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/generic/info_text.dart';
import 'package:recipath/widgets/screens/import_screen/import_routes.dart';
import 'package:recipath/widgets/screens/import_screen/providers/recipe_import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/recipe_import.dart';

class RecipeImportScreen extends ConsumerWidget {
  const RecipeImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;
    final state = ref.watch(recipeImportScreenProvider(filePath));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.importData,
          style: TextTheme.of(context).titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (state.value!.importRecipe.isNotEmpty) {
            context.go(
              "/import/${Uri.encodeComponent(state.value!.path)}/${ImportRoutes.groceryImport.path}",
            );
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(localization.selectOne)));
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
              InfoText(text: localization.recipeImportInfo),
              Expanded(child: RecipeImport(data: data)),
            ],
          ),
        ),
      ),
    );
  }
}
