import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:recipath/data/ingredient_data/ingredient_data.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/screens/shopping_screen/providers/shopping_screen_state_notifier.dart';
import 'package:recipath/widgets/screens/shopping_screen/suggestion_item.dart';

class ShoppingEmptyState extends ConsumerWidget {
  const ShoppingEmptyState({
    required this.state,
    required this.search,
    super.key,
  });

  final ShoppingScreenState state;
  final String search;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = AppLocalizations.of(context)!;

    if (search.length >= 3) {
      final lowerSearch = search.toLowerCase();

      final suggestions = state.groceryMap.values
          .where((e) => e.name.toLowerCase().contains(lowerSearch))
          .map(
            (e) => SuggestionItem(
              ingredient: IngredientData.fromGrocery(e, amount: e.normalAmount),
            ),
          );

      if (suggestions.isNotEmpty) {
        return SingleChildScrollView(
          child: Column(children: suggestions.toList()),
        );
      }
    }

    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          EmptyState(
            hint: localization.shoppingHint,
            onTap: () => context.go(RootRoutes.recipeRoute.path),
          ),
        ],
      ),
    );
  }
}
