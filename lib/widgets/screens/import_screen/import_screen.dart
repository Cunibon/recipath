import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/import_screen/providers/import_screen_notifier.dart';
import 'package:recipath/widgets/screens/import_screen/recipe_import.dart';

class ImportScreen extends ConsumerStatefulWidget {
  const ImportScreen({required this.filePath, super.key});

  final String filePath;

  @override
  ConsumerState<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends ConsumerState<ImportScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(importScreenProvider(widget.filePath));

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.go(RootRoutes.recipeRoute.path),
        ),
      ),
      body: CachedAsyncValueWrapper(
        asyncState: state,
        builder: (data) => RecipeImport(data: data),
      ),
    );
  }
}
